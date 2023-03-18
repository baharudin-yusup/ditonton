import 'package:dartz/dartz.dart';

import '../../common/failure.dart';

abstract class AnalyticRepository {
  Future<Either<Failure, Unit>> logSelectedContent(
    String contentType,
    String contentId,
  );
}
