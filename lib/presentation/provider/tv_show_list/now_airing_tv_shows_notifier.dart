import 'package:core/domain/entities/watchlist.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/get_now_airing_tv_shows.dart';
import 'package:ditonton/presentation/provider/entertainment_list_notifier.dart';

class NowAiringTvShowsNotifier extends EntertainmentListNotifier {
  NowAiringTvShowsNotifier(this._getNowAiringTvShows);

  var _datum = <TvShow>[];
  var _message = '';
  var _state = RequestState.Empty;
  var _page = 1;

  final GetNowAiringTvShows _getNowAiringTvShows;

  @override
  List<Watchlist> get list => _datum;

  @override
  String get message => _message;

  @override
  RequestState get state => _state;

  @override
  Future<void> fetch() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await _getNowAiringTvShows(_page);
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
