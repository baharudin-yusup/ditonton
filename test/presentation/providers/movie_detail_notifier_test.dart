import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_movie_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_movie_watchlist.dart';
import 'package:ditonton/domain/usecases/save_movie_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/presentation/blocs/movie_detail_notifier.dart';

import '../../../modules/movie/lib/domain/entities/movie.dart';
import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetMovieWatchListStatus,
  SaveMovieWatchlist,
  RemoveMovieWatchlist,
])
void main() {
  late MovieDetailNotifier provider;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetMovieWatchListStatus mockGetWatchlistStatus;
  late MockSaveMovieWatchlist mockSaveWatchlist;
  late MockRemoveMovieWatchlist mockRemoveWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchlistStatus = MockGetMovieWatchListStatus();
    mockSaveWatchlist = MockSaveMovieWatchlist();
    mockRemoveWatchlist = MockRemoveMovieWatchlist();
    provider = MovieDetailNotifier(
      mockGetMovieDetail,
      mockGetMovieRecommendations,
      mockGetWatchlistStatus,
      mockSaveWatchlist,
      mockRemoveWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[tMovie];

  void _arrangeUsecase() {
    when(mockGetMovieDetail(tId))
        .thenAnswer((_) async => Right(testMovieDetail));
    when(mockGetMovieRecommendations(tId))
        .thenAnswer((_) async => Right(tMovies));
  }

  group('Get Movie Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      verify(mockGetMovieDetail(tId));
      verify(mockGetMovieRecommendations(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchMovieDetail(tId);
      // assert
      expect(provider.movieState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change movie when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      expect(provider.movieState, RequestState.Loaded);
      expect(provider.movie, testMovieDetail);
      expect(listenerCallCount, 3);
    });

    test('should change recommendation movies when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      expect(provider.movieState, RequestState.Loaded);
      expect(provider.movieRecommendations, tMovies);
    });
  });

  group('Get Movie Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      verify(mockGetMovieRecommendations(tId));
      expect(provider.movieRecommendations, tMovies);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Loaded);
      expect(provider.movieRecommendations, tMovies);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetMovieDetail(tId))
          .thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchlistStatus(1)).thenAnswer((_) async => true);
      // act
      await provider.loadWatchlistStatus(1);
      // assert
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlist(testMovieDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetWatchlistStatus(testMovieDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testMovieDetail);
      // assert
      verify(mockSaveWatchlist(testMovieDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist(testMovieDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetWatchlistStatus(testMovieDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.removeFromWatchlist(testMovieDetail);
      // assert
      verify(mockRemoveWatchlist(testMovieDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlist(testMovieDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetWatchlistStatus(testMovieDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testMovieDetail);
      // assert
      verify(mockGetWatchlistStatus(testMovieDetail.id));
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlist(testMovieDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchlistStatus(testMovieDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.addWatchlist(testMovieDetail);
      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetMovieDetail(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations(tId))
          .thenAnswer((_) async => Right(tMovies));
      // act
      await provider.fetchMovieDetail(tId);
      // assert
      expect(provider.movieState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
