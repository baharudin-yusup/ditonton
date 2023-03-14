import 'package:core/domain/entities/watchlist.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:ditonton/presentation/provider/entertainment_list_notifier.dart';

class TvShowRecommendationsNotifier extends EntertainmentListNotifier {
  TvShowRecommendationsNotifier(this._getTvShowRecommendations);

  late int _id;
  var _datum = <TvShow>[];
  var _message = '';
  var _state = RequestState.Empty;
  var _page = 1;

  final GetTvShowRecommendations _getTvShowRecommendations;

  @override
  List<Watchlist> get list => _datum;

  @override
  String get message => _message;

  @override
  RequestState get state => _state;

  @override
  void setId(int id) {
    _id = id;
  }

  @override
  Future<void> fetch() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await _getTvShowRecommendations(_id, _page);
    result.fold(
      (failure) {
        _state = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (datum) {
        _state = RequestState.Loaded;
        _datum = datum;
        notifyListeners();
      },
    );
  }

  @override
  void next() {
    if (_state != RequestState.Loaded) {
      return;
    }
    _page++;
    fetch();
  }

  @override
  void previous() {
    if (_state != RequestState.Loaded || _page == 1) {
      return;
    }
    _page--;
    fetch();
  }
}
