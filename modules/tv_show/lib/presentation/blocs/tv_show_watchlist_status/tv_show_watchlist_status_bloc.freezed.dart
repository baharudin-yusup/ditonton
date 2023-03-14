// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show_watchlist_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TvShowWatchlistStatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchDataStarted,
    required TResult Function(TvShowDetail tvShow) toggleWatchlistStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetchDataStarted,
    TResult? Function(TvShowDetail tvShow)? toggleWatchlistStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchDataStarted,
    TResult Function(TvShowDetail tvShow)? toggleWatchlistStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDataStarted value) fetchDataStarted,
    required TResult Function(_ToggleWatchlistStarted value)
        toggleWatchlistStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDataStarted value)? fetchDataStarted,
    TResult? Function(_ToggleWatchlistStarted value)? toggleWatchlistStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDataStarted value)? fetchDataStarted,
    TResult Function(_ToggleWatchlistStarted value)? toggleWatchlistStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowWatchlistStatusEventCopyWith<$Res> {
  factory $TvShowWatchlistStatusEventCopyWith(TvShowWatchlistStatusEvent value,
          $Res Function(TvShowWatchlistStatusEvent) then) =
      _$TvShowWatchlistStatusEventCopyWithImpl<$Res,
          TvShowWatchlistStatusEvent>;
}

/// @nodoc
class _$TvShowWatchlistStatusEventCopyWithImpl<$Res,
        $Val extends TvShowWatchlistStatusEvent>
    implements $TvShowWatchlistStatusEventCopyWith<$Res> {
  _$TvShowWatchlistStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchDataStartedCopyWith<$Res> {
  factory _$$_FetchDataStartedCopyWith(
          _$_FetchDataStarted value, $Res Function(_$_FetchDataStarted) then) =
      __$$_FetchDataStartedCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_FetchDataStartedCopyWithImpl<$Res>
    extends _$TvShowWatchlistStatusEventCopyWithImpl<$Res, _$_FetchDataStarted>
    implements _$$_FetchDataStartedCopyWith<$Res> {
  __$$_FetchDataStartedCopyWithImpl(
      _$_FetchDataStarted _value, $Res Function(_$_FetchDataStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_FetchDataStarted(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchDataStarted implements _FetchDataStarted {
  const _$_FetchDataStarted(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TvShowWatchlistStatusEvent.fetchDataStarted(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataStarted &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataStartedCopyWith<_$_FetchDataStarted> get copyWith =>
      __$$_FetchDataStartedCopyWithImpl<_$_FetchDataStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchDataStarted,
    required TResult Function(TvShowDetail tvShow) toggleWatchlistStarted,
  }) {
    return fetchDataStarted(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetchDataStarted,
    TResult? Function(TvShowDetail tvShow)? toggleWatchlistStarted,
  }) {
    return fetchDataStarted?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchDataStarted,
    TResult Function(TvShowDetail tvShow)? toggleWatchlistStarted,
    required TResult orElse(),
  }) {
    if (fetchDataStarted != null) {
      return fetchDataStarted(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDataStarted value) fetchDataStarted,
    required TResult Function(_ToggleWatchlistStarted value)
        toggleWatchlistStarted,
  }) {
    return fetchDataStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDataStarted value)? fetchDataStarted,
    TResult? Function(_ToggleWatchlistStarted value)? toggleWatchlistStarted,
  }) {
    return fetchDataStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDataStarted value)? fetchDataStarted,
    TResult Function(_ToggleWatchlistStarted value)? toggleWatchlistStarted,
    required TResult orElse(),
  }) {
    if (fetchDataStarted != null) {
      return fetchDataStarted(this);
    }
    return orElse();
  }
}

abstract class _FetchDataStarted implements TvShowWatchlistStatusEvent {
  const factory _FetchDataStarted(final int id) = _$_FetchDataStarted;

  int get id;
  @JsonKey(ignore: true)
  _$$_FetchDataStartedCopyWith<_$_FetchDataStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleWatchlistStartedCopyWith<$Res> {
  factory _$$_ToggleWatchlistStartedCopyWith(_$_ToggleWatchlistStarted value,
          $Res Function(_$_ToggleWatchlistStarted) then) =
      __$$_ToggleWatchlistStartedCopyWithImpl<$Res>;
  @useResult
  $Res call({TvShowDetail tvShow});
}

/// @nodoc
class __$$_ToggleWatchlistStartedCopyWithImpl<$Res>
    extends _$TvShowWatchlistStatusEventCopyWithImpl<$Res,
        _$_ToggleWatchlistStarted>
    implements _$$_ToggleWatchlistStartedCopyWith<$Res> {
  __$$_ToggleWatchlistStartedCopyWithImpl(_$_ToggleWatchlistStarted _value,
      $Res Function(_$_ToggleWatchlistStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tvShow = null,
  }) {
    return _then(_$_ToggleWatchlistStarted(
      null == tvShow
          ? _value.tvShow
          : tvShow // ignore: cast_nullable_to_non_nullable
              as TvShowDetail,
    ));
  }
}

/// @nodoc

class _$_ToggleWatchlistStarted implements _ToggleWatchlistStarted {
  const _$_ToggleWatchlistStarted(this.tvShow);

  @override
  final TvShowDetail tvShow;

  @override
  String toString() {
    return 'TvShowWatchlistStatusEvent.toggleWatchlistStarted(tvShow: $tvShow)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleWatchlistStarted &&
            (identical(other.tvShow, tvShow) || other.tvShow == tvShow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tvShow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleWatchlistStartedCopyWith<_$_ToggleWatchlistStarted> get copyWith =>
      __$$_ToggleWatchlistStartedCopyWithImpl<_$_ToggleWatchlistStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchDataStarted,
    required TResult Function(TvShowDetail tvShow) toggleWatchlistStarted,
  }) {
    return toggleWatchlistStarted(tvShow);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? fetchDataStarted,
    TResult? Function(TvShowDetail tvShow)? toggleWatchlistStarted,
  }) {
    return toggleWatchlistStarted?.call(tvShow);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchDataStarted,
    TResult Function(TvShowDetail tvShow)? toggleWatchlistStarted,
    required TResult orElse(),
  }) {
    if (toggleWatchlistStarted != null) {
      return toggleWatchlistStarted(tvShow);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDataStarted value) fetchDataStarted,
    required TResult Function(_ToggleWatchlistStarted value)
        toggleWatchlistStarted,
  }) {
    return toggleWatchlistStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDataStarted value)? fetchDataStarted,
    TResult? Function(_ToggleWatchlistStarted value)? toggleWatchlistStarted,
  }) {
    return toggleWatchlistStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDataStarted value)? fetchDataStarted,
    TResult Function(_ToggleWatchlistStarted value)? toggleWatchlistStarted,
    required TResult orElse(),
  }) {
    if (toggleWatchlistStarted != null) {
      return toggleWatchlistStarted(this);
    }
    return orElse();
  }
}

abstract class _ToggleWatchlistStarted implements TvShowWatchlistStatusEvent {
  const factory _ToggleWatchlistStarted(final TvShowDetail tvShow) =
      _$_ToggleWatchlistStarted;

  TvShowDetail get tvShow;
  @JsonKey(ignore: true)
  _$$_ToggleWatchlistStartedCopyWith<_$_ToggleWatchlistStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TvShowWatchlistStatusState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchDataInProgress,
    required TResult Function(bool isAddedToWatchlist, String? message)
        fetchDataSuccess,
    required TResult Function(String message) fetchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchDataInProgress,
    TResult? Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult? Function(String message)? fetchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchDataInProgress,
    TResult Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult Function(String message)? fetchDataFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchDataInProgress value) fetchDataInProgress,
    required TResult Function(_FetchDataSuccess value) fetchDataSuccess,
    required TResult Function(_FetchDataFailure value) fetchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult? Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult? Function(_FetchDataFailure value)? fetchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult Function(_FetchDataFailure value)? fetchDataFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowWatchlistStatusStateCopyWith<$Res> {
  factory $TvShowWatchlistStatusStateCopyWith(TvShowWatchlistStatusState value,
          $Res Function(TvShowWatchlistStatusState) then) =
      _$TvShowWatchlistStatusStateCopyWithImpl<$Res,
          TvShowWatchlistStatusState>;
}

/// @nodoc
class _$TvShowWatchlistStatusStateCopyWithImpl<$Res,
        $Val extends TvShowWatchlistStatusState>
    implements $TvShowWatchlistStatusStateCopyWith<$Res> {
  _$TvShowWatchlistStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TvShowWatchlistStatusStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TvShowWatchlistStatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchDataInProgress,
    required TResult Function(bool isAddedToWatchlist, String? message)
        fetchDataSuccess,
    required TResult Function(String message) fetchDataFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchDataInProgress,
    TResult? Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult? Function(String message)? fetchDataFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchDataInProgress,
    TResult Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult Function(String message)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchDataInProgress value) fetchDataInProgress,
    required TResult Function(_FetchDataSuccess value) fetchDataSuccess,
    required TResult Function(_FetchDataFailure value) fetchDataFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult? Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult? Function(_FetchDataFailure value)? fetchDataFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult Function(_FetchDataFailure value)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TvShowWatchlistStatusState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_FetchDataInProgressCopyWith<$Res> {
  factory _$$_FetchDataInProgressCopyWith(_$_FetchDataInProgress value,
          $Res Function(_$_FetchDataInProgress) then) =
      __$$_FetchDataInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchDataInProgressCopyWithImpl<$Res>
    extends _$TvShowWatchlistStatusStateCopyWithImpl<$Res,
        _$_FetchDataInProgress>
    implements _$$_FetchDataInProgressCopyWith<$Res> {
  __$$_FetchDataInProgressCopyWithImpl(_$_FetchDataInProgress _value,
      $Res Function(_$_FetchDataInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchDataInProgress implements _FetchDataInProgress {
  const _$_FetchDataInProgress();

  @override
  String toString() {
    return 'TvShowWatchlistStatusState.fetchDataInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchDataInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchDataInProgress,
    required TResult Function(bool isAddedToWatchlist, String? message)
        fetchDataSuccess,
    required TResult Function(String message) fetchDataFailure,
  }) {
    return fetchDataInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchDataInProgress,
    TResult? Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult? Function(String message)? fetchDataFailure,
  }) {
    return fetchDataInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchDataInProgress,
    TResult Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult Function(String message)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataInProgress != null) {
      return fetchDataInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchDataInProgress value) fetchDataInProgress,
    required TResult Function(_FetchDataSuccess value) fetchDataSuccess,
    required TResult Function(_FetchDataFailure value) fetchDataFailure,
  }) {
    return fetchDataInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult? Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult? Function(_FetchDataFailure value)? fetchDataFailure,
  }) {
    return fetchDataInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult Function(_FetchDataFailure value)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataInProgress != null) {
      return fetchDataInProgress(this);
    }
    return orElse();
  }
}

abstract class _FetchDataInProgress implements TvShowWatchlistStatusState {
  const factory _FetchDataInProgress() = _$_FetchDataInProgress;
}

/// @nodoc
abstract class _$$_FetchDataSuccessCopyWith<$Res> {
  factory _$$_FetchDataSuccessCopyWith(
          _$_FetchDataSuccess value, $Res Function(_$_FetchDataSuccess) then) =
      __$$_FetchDataSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAddedToWatchlist, String? message});
}

/// @nodoc
class __$$_FetchDataSuccessCopyWithImpl<$Res>
    extends _$TvShowWatchlistStatusStateCopyWithImpl<$Res, _$_FetchDataSuccess>
    implements _$$_FetchDataSuccessCopyWith<$Res> {
  __$$_FetchDataSuccessCopyWithImpl(
      _$_FetchDataSuccess _value, $Res Function(_$_FetchDataSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAddedToWatchlist = null,
    Object? message = freezed,
  }) {
    return _then(_$_FetchDataSuccess(
      null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FetchDataSuccess implements _FetchDataSuccess {
  const _$_FetchDataSuccess(this.isAddedToWatchlist, {this.message});

  @override
  final bool isAddedToWatchlist;
  @override
  final String? message;

  @override
  String toString() {
    return 'TvShowWatchlistStatusState.fetchDataSuccess(isAddedToWatchlist: $isAddedToWatchlist, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataSuccess &&
            (identical(other.isAddedToWatchlist, isAddedToWatchlist) ||
                other.isAddedToWatchlist == isAddedToWatchlist) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAddedToWatchlist, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataSuccessCopyWith<_$_FetchDataSuccess> get copyWith =>
      __$$_FetchDataSuccessCopyWithImpl<_$_FetchDataSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchDataInProgress,
    required TResult Function(bool isAddedToWatchlist, String? message)
        fetchDataSuccess,
    required TResult Function(String message) fetchDataFailure,
  }) {
    return fetchDataSuccess(isAddedToWatchlist, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchDataInProgress,
    TResult? Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult? Function(String message)? fetchDataFailure,
  }) {
    return fetchDataSuccess?.call(isAddedToWatchlist, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchDataInProgress,
    TResult Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult Function(String message)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataSuccess != null) {
      return fetchDataSuccess(isAddedToWatchlist, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchDataInProgress value) fetchDataInProgress,
    required TResult Function(_FetchDataSuccess value) fetchDataSuccess,
    required TResult Function(_FetchDataFailure value) fetchDataFailure,
  }) {
    return fetchDataSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult? Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult? Function(_FetchDataFailure value)? fetchDataFailure,
  }) {
    return fetchDataSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult Function(_FetchDataFailure value)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataSuccess != null) {
      return fetchDataSuccess(this);
    }
    return orElse();
  }
}

abstract class _FetchDataSuccess implements TvShowWatchlistStatusState {
  const factory _FetchDataSuccess(final bool isAddedToWatchlist,
      {final String? message}) = _$_FetchDataSuccess;

  bool get isAddedToWatchlist;
  String? get message;
  @JsonKey(ignore: true)
  _$$_FetchDataSuccessCopyWith<_$_FetchDataSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchDataFailureCopyWith<$Res> {
  factory _$$_FetchDataFailureCopyWith(
          _$_FetchDataFailure value, $Res Function(_$_FetchDataFailure) then) =
      __$$_FetchDataFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_FetchDataFailureCopyWithImpl<$Res>
    extends _$TvShowWatchlistStatusStateCopyWithImpl<$Res, _$_FetchDataFailure>
    implements _$$_FetchDataFailureCopyWith<$Res> {
  __$$_FetchDataFailureCopyWithImpl(
      _$_FetchDataFailure _value, $Res Function(_$_FetchDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_FetchDataFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchDataFailure implements _FetchDataFailure {
  const _$_FetchDataFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TvShowWatchlistStatusState.fetchDataFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataFailureCopyWith<_$_FetchDataFailure> get copyWith =>
      __$$_FetchDataFailureCopyWithImpl<_$_FetchDataFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchDataInProgress,
    required TResult Function(bool isAddedToWatchlist, String? message)
        fetchDataSuccess,
    required TResult Function(String message) fetchDataFailure,
  }) {
    return fetchDataFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchDataInProgress,
    TResult? Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult? Function(String message)? fetchDataFailure,
  }) {
    return fetchDataFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchDataInProgress,
    TResult Function(bool isAddedToWatchlist, String? message)?
        fetchDataSuccess,
    TResult Function(String message)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataFailure != null) {
      return fetchDataFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FetchDataInProgress value) fetchDataInProgress,
    required TResult Function(_FetchDataSuccess value) fetchDataSuccess,
    required TResult Function(_FetchDataFailure value) fetchDataFailure,
  }) {
    return fetchDataFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult? Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult? Function(_FetchDataFailure value)? fetchDataFailure,
  }) {
    return fetchDataFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FetchDataInProgress value)? fetchDataInProgress,
    TResult Function(_FetchDataSuccess value)? fetchDataSuccess,
    TResult Function(_FetchDataFailure value)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataFailure != null) {
      return fetchDataFailure(this);
    }
    return orElse();
  }
}

abstract class _FetchDataFailure implements TvShowWatchlistStatusState {
  const factory _FetchDataFailure(final String message) = _$_FetchDataFailure;

  String get message;
  @JsonKey(ignore: true)
  _$$_FetchDataFailureCopyWith<_$_FetchDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
