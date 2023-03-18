import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:core/data/repositories/analytic_repository_impl.dart';
import 'package:core/data/sources/analytic_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'analytic_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AnalyticRemoteDataSource>()])
void main() {
  late MockAnalyticRemoteDataSource mockRemoteDataSource;
  late AnalyticRepositoryImpl repositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockAnalyticRemoteDataSource();
    repositoryImpl = AnalyticRepositoryImpl(mockRemoteDataSource);
  });

  group('logSelectedContent method', () {
    test('should return ${const Right(unit)} when all process is successful',
        () async {
      // Arrange
      const contentType = 'movie';
      const contentId = '123';

      when(mockRemoteDataSource.logSelectedContent(contentType, contentId))
          .thenAnswer((_) async {});

      // Act
      final result = await repositoryImpl.logSelectedContent(
        contentType,
        contentId,
      );

      // Assert
      expect(result, const Right(unit));
    });

    test(
        'should return ${const ServerFailure()} when remote data source throw unknown ${ServerException()}',
        () async {
      // Arrange
      const contentType = 'movie';
      const contentId = '123';

      when(mockRemoteDataSource.logSelectedContent(contentType, contentId))
          .thenThrow(ServerException());

      // Act
      final result = await repositoryImpl.logSelectedContent(
        contentType,
        contentId,
      );

      // Assert
      expect(result, const Left(ServerFailure()));
    });
  });
}
