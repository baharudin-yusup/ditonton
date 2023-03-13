import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/presentation/provider/movie_list/movie_recomendations_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_recommendations_notifier_test.mocks.dart';

typedef Notifier = MovieRecommendationsNotifier;

@GenerateMocks([],
    customMocks: [MockSpec<GetMovieRecommendations>(as: #MockTarget)])
void main() {
  late MockTarget mockTarget;
  late Notifier notifier;
  late int listenerCallCount;

  final id = 1;

  setUp(() {
    listenerCallCount = 0;
    mockTarget = MockTarget();
    notifier = Notifier(mockTarget)
      ..addListener(() {
        listenerCallCount++;
      })
      ..setId(id);
  });

  final tEntity = testMovie;

  final tEntityList = [tEntity];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockTarget(id)).thenAnswer((_) async => Right(tEntityList));
    // act
    notifier.fetch();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockTarget(id)).thenAnswer((_) async => Right(tEntityList));
    // act
    await notifier.fetch();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.list, tEntityList.map((e) => e.toWatchlist()).toList());
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockTarget(id))
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetch();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
