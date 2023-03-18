import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../../domain/repositories/analytic_repository.dart';
import '../sources/analytic_remote_data_source.dart';

class AnalyticRepositoryImpl implements AnalyticRepository {
  final AnalyticRemoteDataSource _remoteDataSource;

  AnalyticRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Unit>> logSelectedContent(
      String contentType, String contentId) async {
    try {
      await _remoteDataSource.logSelectedContent(contentType, contentId);
      return const Right(unit);
    } on Exception catch (exception) {
      return const Left(ServerFailure());
    }
  }
}
