import 'package:core/domain/entities/watchlist.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/usecases/search_tv_shows.dart';
import 'package:ditonton/presentation/provider/search_entertainment_notifier.dart';

class SearchTvShowNotifier extends SearchEntertainmentNotifier {
  var _message = '';
  var _searchResult = <TvShow>[];
  var _state = RequestState.Empty;

  final SearchTvShows _searchTvShows;

  SearchTvShowNotifier(this._searchTvShows);

  @override
  String get message => _message;

  @override
  List<Watchlist> get results => _searchResult;

  @override
  RequestState get state => _state;

  @override
  Future<void> search(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await _searchTvShows(query);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
