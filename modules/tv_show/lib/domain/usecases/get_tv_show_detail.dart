import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/tv_show_detail.dart';
import '../repositories/tv_show_repository.dart';

class GetTvShowDetail {
  final TvShowRepository repository;

  GetTvShowDetail(this.repository);

  Future<Either<Failure, TvShowDetail>> call(int id) {
    return repository.getTvShowDetail(id);
  }
}
