import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_show_watchlist.dart';
import 'package:ditonton/presentation/provider/tv_show_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_show_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTvShowDetail,
  GetTvShowRecommendations,
  GetTvShowWatchListStatus,
  SaveTvShowWatchlist,
  RemoveTvShowWatchlist,
])
void main() {
  late TvShowDetailNotifier provider;
  late MockGetTvShowDetail mockGetDetail;
  late MockGetTvShowRecommendations mockGetRecommendations;
  late MockGetTvShowWatchListStatus mockGetWatchlistStatus;
  late MockSaveTvShowWatchlist mockSaveWatchlist;
  late MockRemoveTvShowWatchlist mockRemoveWatchlist;
  late int listenerCallCount;

  final tId = 1;

  setUp(() {
    listenerCallCount = 0;
    mockGetDetail = MockGetTvShowDetail();
    mockGetRecommendations = MockGetTvShowRecommendations();
    mockGetWatchlistStatus = MockGetTvShowWatchListStatus();
    mockSaveWatchlist = MockSaveTvShowWatchlist();
    mockRemoveWatchlist = MockRemoveTvShowWatchlist();
    provider = TvShowDetailNotifier(
      mockGetDetail,
      mockGetRecommendations,
      mockGetWatchlistStatus,
      mockSaveWatchlist,
      mockRemoveWatchlist,
    )
      ..addListener(() {
        listenerCallCount += 1;
      })
      ..setId(1);
  });

  final tTvShowList = [testTvShow];
  final tWatchlist = tTvShowList.toWatchlist();

  void _arrangeUsecase() {
    when(mockGetDetail(tId)).thenAnswer((_) async => Right(testTvShowDetail));
    when(mockGetRecommendations(tId))
        .thenAnswer((_) async => Right(tTvShowList));
  }

  group('Get TV Show Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchDetail();
      // assert
      verify(mockGetDetail(tId));
      verify(mockGetRecommendations(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchDetail();
      // assert
      expect(provider.detailState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change tv show when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchDetail();
      // assert
      expect(provider.detailState, RequestState.Loaded);
      expect(provider.detail, testTvShowDetail);
      expect(listenerCallCount, 3);
    });

    test(
        'should change recommendation tv shows when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchDetail();
      // assert
      expect(provider.detailState, RequestState.Loaded);
      expect(provider.recommendations, tWatchlist);
    });
  });

  group('Get TV Show Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchDetail();
      // assert
      verify(mockGetRecommendations(tId));
      expect(provider.recommendations, tWatchlist);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchDetail();
      // assert
      expect(provider.recommendationState, RequestState.Loaded);
      expect(provider.recommendations, tWatchlist);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetDetail(tId)).thenAnswer((_) async => Right(testTvShowDetail));
      when(mockGetRecommendations(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await provider.fetchDetail();
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
      when(mockSaveWatchlist(testTvShowDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetWatchlistStatus(testTvShowDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testTvShowDetail);
      // assert
      verify(mockSaveWatchlist(testTvShowDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist(testTvShowDetail))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetWatchlistStatus(testTvShowDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.removeFromWatchlist(testTvShowDetail);
      // assert
      verify(mockRemoveWatchlist(testTvShowDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlist(testTvShowDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetWatchlistStatus(testTvShowDetail.id))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testTvShowDetail);
      // assert
      verify(mockGetWatchlistStatus(testTvShowDetail.id));
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlist(testTvShowDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchlistStatus(testTvShowDetail.id))
          .thenAnswer((_) async => false);
      // act
      await provider.addWatchlist(testTvShowDetail);
      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('On Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetDetail(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetRecommendations(tId))
          .thenAnswer((_) async => Right(tTvShowList));
      // act
      await provider.fetchDetail();
      // assert
      expect(provider.detailState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
