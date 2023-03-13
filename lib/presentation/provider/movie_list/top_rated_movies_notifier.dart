import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_top_rated_movies.dart';
import 'package:ditonton/presentation/provider/entertainment_list_notifier.dart';

class TopRatedMoviesNotifier extends EntertainmentListNotifier {
  TopRatedMoviesNotifier(this._getTopRatedMovies);

  var _datum = <Movie>[];
  var _message = '';
  var _state = RequestState.Empty;
  var _page = 1;

  final GetTopRatedMovies _getTopRatedMovies;

  @override
  List<Watchlist> get list => _datum.map((data) => data.toWatchlist()).toList();

  @override
  String get message => _message;

  @override
  RequestState get state => _state;

  @override
  Future<void> fetch() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await _getTopRatedMovies(_page);
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
