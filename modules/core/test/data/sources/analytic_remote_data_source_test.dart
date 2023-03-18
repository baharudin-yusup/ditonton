import 'package:core/common/exception.dart';
import 'package:core/data/sources/analytic_remote_data_source.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'analytic_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FirebaseAnalytics>()])
void main() {
  late MockFirebaseAnalytics mockPlugin;
  late AnalyticRemoteDataSourceImpl remoteDataSourceImpl;

  setUp(() {
    mockPlugin = MockFirebaseAnalytics();
    remoteDataSourceImpl = AnalyticRemoteDataSourceImpl(mockPlugin);
  });

  group('logSelectedContent method', () {
    const contentType = 'movie';
    const contentId = '123';
    test('should return void when all process is successful', () async {
      // Arrange
      when(mockPlugin.logSelectContent(
              contentType: contentType, itemId: contentId))
          .thenAnswer((_) async {});

      // Act
      final call = await remoteDataSourceImpl.logSelectedContent(
        contentType,
        contentId,
      );

      // Assert
      expect(() => call, isA<void>());
    });

    test(
        'should throw ${ServerException()} when plugin failed process and logic did not handle that exception',
        () async {
      // Arrange
      const contentType = 'movie';
      const contentId = '123';

      when(mockPlugin.logSelectContent(
              contentType: contentType, itemId: contentId))
          .thenThrow(Exception());

      // Act
      final call = remoteDataSourceImpl.logSelectedContent(
        contentType,
        contentId,
      );

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
