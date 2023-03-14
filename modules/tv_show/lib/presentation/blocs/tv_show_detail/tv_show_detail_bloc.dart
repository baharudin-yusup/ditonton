import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_tv_show_detail.dart';

part 'tv_show_detail_bloc.freezed.dart';
part 'tv_show_detail_event.dart';
part 'tv_show_detail_state.dart';

class TvShowDetailBloc extends Bloc<TvShowDetailEvent, TvShowDetailState> {
  TvShowDetailBloc(this._getTvShowDetail) : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetTvShowDetail _getTvShowDetail;

  void _fetchData(
      _FetchDataStarted event, Emitter<TvShowDetailState> emit) async {
    emit(const _FetchDataInProgress());

    final result = await _getTvShowDetail(event.id);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message)),
      (movieDetail) => emit(_FetchDataSuccess(movieDetail)),
    );
  }
}
