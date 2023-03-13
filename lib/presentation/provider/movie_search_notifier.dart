import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/provider/search_entertainment_notifier.dart';

class SearchMovieNotifier extends SearchEntertainmentNotifier {
  final SearchMovies searchMovies;

  SearchMovieNotifier({required this.searchMovies});

  RequestState _state = RequestState.Empty;

  @override
  RequestState get state => _state;

  List<Movie> _searchResult = [];

  @override
  List<Watchlist> get results =>
      _searchResult.map((e) => e.toWatchlist()).toList();

  String _message = '';

  @override
  String get message => _message;

  @override
  Future<void> search(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchMovies(query);
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
