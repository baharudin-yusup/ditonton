import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_tv_show_recommendations.dart';

part 'tv_show_recommendations_bloc.freezed.dart';
part 'tv_show_recommendations_event.dart';
part 'tv_show_recommendations_state.dart';

class TvShowRecommendationsBloc
    extends Bloc<TvShowRecommendationsEvent, TvShowRecommendationsState> {
  TvShowRecommendationsBloc(this._getTvShowRecommendations)
      : super(const _Initial()) {
    on<_FetchDataStarted>(_fetchData);
  }

  final GetTvShowRecommendations _getTvShowRecommendations;

  void _fetchData(
      _FetchDataStarted event, Emitter<TvShowRecommendationsState> emit) async {
    emit(_FetchDataInProgress(page: event.page));

    final result = await _getTvShowRecommendations(event.id, event.page);
    result.fold(
      (failure) => emit(_FetchDataFailure(failure.message, page: state.page)),
      (movies) => emit(_FetchDataSuccess(movies, page: state.page)),
    );
  }
}
