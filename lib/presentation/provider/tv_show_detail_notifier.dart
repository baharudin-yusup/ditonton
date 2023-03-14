import 'package:core/domain/entities/watchlist.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_show_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_show_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_tv_show_watchlist.dart';
import 'package:ditonton/domain/usecases/save_tv_show_watchlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/tv_show.dart';

class TvShowDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvShowDetail _getDetail;
  final GetTvShowRecommendations _getRecommendations;
  final GetTvShowWatchListStatus _getWatchListStatus;
  final SaveTvShowWatchlist _saveWatchlist;
  final RemoveTvShowWatchlist _removeWatchlist;

  late int _id;

  late TvShowDetail _detail;

  TvShowDetailNotifier(this._getDetail, this._getRecommendations,
      this._getWatchListStatus, this._saveWatchlist, this._removeWatchlist);

  TvShowDetail get detail => _detail;

  RequestState _detailState = RequestState.Empty;

  RequestState get detailState => _detailState;

  List<TvShow> _recommendations = [];

  List<Watchlist> get recommendations => _recommendations;

  RequestState _recommendationState = RequestState.Empty;

  RequestState get recommendationState => _recommendationState;

  String _message = '';

  String get message => _message;

  bool _isAddedToWatchlist = false;

  bool get isAddedToWatchlist => _isAddedToWatchlist;

  void setId(int id) {
    _id = id;
  }

  Future<void> fetchDetail() async {
    _detailState = RequestState.Loading;
    notifyListeners();
    final detailResult = await _getDetail(_id);
    final recommendationResult = await _getRecommendations(_id);
    detailResult.fold(
      (failure) {
        _detailState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvShow) {
        _recommendationState = RequestState.Loading;
        _detail = tvShow;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (movies) {
            _recommendationState = RequestState.Loaded;
            _recommendations = movies;
          },
        );
        _detailState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';

  String get watchlistMessage => _watchlistMessage;

  Future<String> toggleWatchlist() async {
    await loadWatchlistStatus();

    if (_isAddedToWatchlist) {
      await removeFromWatchlist(_detail);
    } else {
      await addWatchlist(_detail);
    }

    return _watchlistMessage;
  }

  Future<void> addWatchlist(TvShowDetail tvShowDetail) async {
    final result = await _saveWatchlist(tvShowDetail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvShowDetail.id);
  }

  Future<void> removeFromWatchlist(TvShowDetail tvShowDetail) async {
    final result = await _removeWatchlist(tvShowDetail);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvShowDetail.id);
  }

  Future<void> loadWatchlistStatus([int? id]) async {
    final result = await _getWatchListStatus(id ?? _id);
    _isAddedToWatchlist = result;
    notifyListeners();
  }
}
