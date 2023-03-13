import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_movie_notifier_test.mocks.dart';

@GenerateMocks([
  GetMovieWatchlist,
  GetTvShowWatchlist,
])
void main() {
  late WatchlistNotifier provider;
  late MockGetMovieWatchlist mockGetWatchlistMovies;
  late MockGetTvShowWatchlist mockGetTvShowWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistMovies = MockGetMovieWatchlist();
    mockGetTvShowWatchlist = MockGetTvShowWatchlist();
    provider = WatchlistNotifier(
      getWatchlistMovies: mockGetWatchlistMovies,
      getTvShowWatchlist: mockGetTvShowWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistMovies())
        .thenAnswer((_) async => Right([testWatchlistMovie]));
    // act
    await provider.fetchWatchlistMovies();
    // assert
    expect(provider.moviesWatchlistState, RequestState.Loaded);
    expect(provider.moviesWatchlist, [testWatchlistMovie.toWatchlist()]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistMovies())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistMovies();
    // assert
    expect(provider.moviesWatchlistState, RequestState.Error);
    expect(provider.moviesMessage, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
