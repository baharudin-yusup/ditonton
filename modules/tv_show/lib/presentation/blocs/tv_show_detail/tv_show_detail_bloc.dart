import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_tv_show_detail.dart';

part 'tv_show_detail_bloc.freezed.dart';
part 'tv_show_detail_event.dart';
part 'tv_show_detail_state.dart';

class TvShowDetailBloc extends Bloc<TvShowDetailEvent, TvShowDetailState> {
  TvShowDetailBloc(this._getTvShowDetail, this._logSelectedContent)
      : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetTvShowDetail _getTvShowDetail;
  final LogSelectedContent _logSelectedContent;

  void _fetchData(
      _FetchDataStarted event, Emitter<TvShowDetailState> emit) async {
    emit(const _FetchDataInProgress());

    final result = await _getTvShowDetail(event.id);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message)),
      (movieDetail) => emit(_FetchDataSuccess(movieDetail)),
    );

    if (result.isLeft()) {
      return;
    }

    final logSelectedContent = await _logSelectedContent(
      contentType: 'tv_show',
      contentId: event.id.toString(),
    );

    logSelectedContent.fold((failure) {
      Logger.error(failure, event: 'calling $LogSelectedContent usecase');
    }, (_) {
      Logger.print('Adding firebase analytics logSelectedContent success!');
    });
  }
}
