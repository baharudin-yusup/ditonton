import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../repositories/analytic_repository.dart';

class LogSelectedContent {
  final AnalyticRepository _repository;

  LogSelectedContent(this._repository);

  Future<Either<Failure, Unit>> call({
    required String contentType,
    required String contentId,
  }) async {
    return await _repository.logSelectedContent(contentType, contentId);
  }
}
