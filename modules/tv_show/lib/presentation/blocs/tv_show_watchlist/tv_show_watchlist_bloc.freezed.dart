// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_show_watchlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TvShowWatchlistEvent {
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) fetchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? fetchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? fetchDataStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDataStarted value) fetchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDataStarted value)? fetchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDataStarted value)? fetchDataStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TvShowWatchlistEventCopyWith<TvShowWatchlistEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowWatchlistEventCopyWith<$Res> {
  factory $TvShowWatchlistEventCopyWith(TvShowWatchlistEvent value,
          $Res Function(TvShowWatchlistEvent) then) =
      _$TvShowWatchlistEventCopyWithImpl<$Res, TvShowWatchlistEvent>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$TvShowWatchlistEventCopyWithImpl<$Res,
        $Val extends TvShowWatchlistEvent>
    implements $TvShowWatchlistEventCopyWith<$Res> {
  _$TvShowWatchlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchDataStartedCopyWith<$Res>
    implements $TvShowWatchlistEventCopyWith<$Res> {
  factory _$$_FetchDataStartedCopyWith(
          _$_FetchDataStarted value, $Res Function(_$_FetchDataStarted) then) =
      __$$_FetchDataStartedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_FetchDataStartedCopyWithImpl<$Res>
    extends _$TvShowWatchlistEventCopyWithImpl<$Res, _$_FetchDataStarted>
    implements _$$_FetchDataStartedCopyWith<$Res> {
  __$$_FetchDataStartedCopyWithImpl(
      _$_FetchDataStarted _value, $Res Function(_$_FetchDataStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_FetchDataStarted(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchDataStarted implements _FetchDataStarted {
  const _$_FetchDataStarted({this.page = 1});

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'TvShowWatchlistEvent.fetchDataStarted(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataStarted &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataStartedCopyWith<_$_FetchDataStarted> get copyWith =>
      __$$_FetchDataStartedCopyWithImpl<_$_FetchDataStarted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) fetchDataStarted,
  }) {
    return fetchDataStarted(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? fetchDataStarted,
  }) {
    return fetchDataStarted?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? fetchDataStarted,
    required TResult orElse(),
  }) {
    if (fetchDataStarted != null) {
      return fetchDataStarted(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDataStarted value) fetchDataStarted,
  }) {
    return fetchDataStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDataStarted value)? fetchDataStarted,
  }) {
    return fetchDataStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDataStarted value)? fetchDataStarted,
    required TResult orElse(),
  }) {
    if (fetchDataStarted != null) {
      return fetchDataStarted(this);
    }
    return orElse();
  }
}

abstract class _FetchDataStarted implements TvShowWatchlistEvent {
  const factory _FetchDataStarted({final int page}) = _$_FetchDataStarted;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_FetchDataStartedCopyWith<_$_FetchDataStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TvShowWatchlistState {
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) fetchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        fetchDataSuccess,
    required TResult Function(String message, int page) fetchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? fetchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult? Function(String message, int page)? fetchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? fetchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult Function(String message, int page)? fetchDataFailure,
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

  @JsonKey(ignore: true)
  $TvShowWatchlistStateCopyWith<TvShowWatchlistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvShowWatchlistStateCopyWith<$Res> {
  factory $TvShowWatchlistStateCopyWith(TvShowWatchlistState value,
          $Res Function(TvShowWatchlistState) then) =
      _$TvShowWatchlistStateCopyWithImpl<$Res, TvShowWatchlistState>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$TvShowWatchlistStateCopyWithImpl<$Res,
        $Val extends TvShowWatchlistState>
    implements $TvShowWatchlistStateCopyWith<$Res> {
  _$TvShowWatchlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $TvShowWatchlistStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TvShowWatchlistStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_Initial(
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial([this.page = 1]);

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'TvShowWatchlistState.initial(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) fetchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        fetchDataSuccess,
    required TResult Function(String message, int page) fetchDataFailure,
  }) {
    return initial(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? fetchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult? Function(String message, int page)? fetchDataFailure,
  }) {
    return initial?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? fetchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult Function(String message, int page)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(page);
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

abstract class _Initial implements TvShowWatchlistState {
  const factory _Initial([final int page]) = _$_Initial;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchDataInProgressCopyWith<$Res>
    implements $TvShowWatchlistStateCopyWith<$Res> {
  factory _$$_FetchDataInProgressCopyWith(_$_FetchDataInProgress value,
          $Res Function(_$_FetchDataInProgress) then) =
      __$$_FetchDataInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_FetchDataInProgressCopyWithImpl<$Res>
    extends _$TvShowWatchlistStateCopyWithImpl<$Res, _$_FetchDataInProgress>
    implements _$$_FetchDataInProgressCopyWith<$Res> {
  __$$_FetchDataInProgressCopyWithImpl(_$_FetchDataInProgress _value,
      $Res Function(_$_FetchDataInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_FetchDataInProgress(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchDataInProgress implements _FetchDataInProgress {
  const _$_FetchDataInProgress({this.page = 1});

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'TvShowWatchlistState.fetchDataInProgress(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataInProgress &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataInProgressCopyWith<_$_FetchDataInProgress> get copyWith =>
      __$$_FetchDataInProgressCopyWithImpl<_$_FetchDataInProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) fetchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        fetchDataSuccess,
    required TResult Function(String message, int page) fetchDataFailure,
  }) {
    return fetchDataInProgress(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? fetchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult? Function(String message, int page)? fetchDataFailure,
  }) {
    return fetchDataInProgress?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? fetchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult Function(String message, int page)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataInProgress != null) {
      return fetchDataInProgress(page);
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

abstract class _FetchDataInProgress implements TvShowWatchlistState {
  const factory _FetchDataInProgress({final int page}) = _$_FetchDataInProgress;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_FetchDataInProgressCopyWith<_$_FetchDataInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchDataSuccessCopyWith<$Res>
    implements $TvShowWatchlistStateCopyWith<$Res> {
  factory _$$_FetchDataSuccessCopyWith(
          _$_FetchDataSuccess value, $Res Function(_$_FetchDataSuccess) then) =
      __$$_FetchDataSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Watchlist> movies, int page});
}

/// @nodoc
class __$$_FetchDataSuccessCopyWithImpl<$Res>
    extends _$TvShowWatchlistStateCopyWithImpl<$Res, _$_FetchDataSuccess>
    implements _$$_FetchDataSuccessCopyWith<$Res> {
  __$$_FetchDataSuccessCopyWithImpl(
      _$_FetchDataSuccess _value, $Res Function(_$_FetchDataSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? page = null,
  }) {
    return _then(_$_FetchDataSuccess(
      null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Watchlist>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchDataSuccess implements _FetchDataSuccess {
  const _$_FetchDataSuccess(final List<Watchlist> movies, {this.page = 1})
      : _movies = movies;

  final List<Watchlist> _movies;
  @override
  List<Watchlist> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'TvShowWatchlistState.fetchDataSuccess(movies: $movies, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataSuccess &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataSuccessCopyWith<_$_FetchDataSuccess> get copyWith =>
      __$$_FetchDataSuccessCopyWithImpl<_$_FetchDataSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) fetchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        fetchDataSuccess,
    required TResult Function(String message, int page) fetchDataFailure,
  }) {
    return fetchDataSuccess(movies, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? fetchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult? Function(String message, int page)? fetchDataFailure,
  }) {
    return fetchDataSuccess?.call(movies, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? fetchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult Function(String message, int page)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataSuccess != null) {
      return fetchDataSuccess(movies, page);
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

abstract class _FetchDataSuccess implements TvShowWatchlistState {
  const factory _FetchDataSuccess(final List<Watchlist> movies,
      {final int page}) = _$_FetchDataSuccess;

  List<Watchlist> get movies;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_FetchDataSuccessCopyWith<_$_FetchDataSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchDataFailureCopyWith<$Res>
    implements $TvShowWatchlistStateCopyWith<$Res> {
  factory _$$_FetchDataFailureCopyWith(
          _$_FetchDataFailure value, $Res Function(_$_FetchDataFailure) then) =
      __$$_FetchDataFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int page});
}

/// @nodoc
class __$$_FetchDataFailureCopyWithImpl<$Res>
    extends _$TvShowWatchlistStateCopyWithImpl<$Res, _$_FetchDataFailure>
    implements _$$_FetchDataFailureCopyWith<$Res> {
  __$$_FetchDataFailureCopyWithImpl(
      _$_FetchDataFailure _value, $Res Function(_$_FetchDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? page = null,
  }) {
    return _then(_$_FetchDataFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchDataFailure implements _FetchDataFailure {
  const _$_FetchDataFailure(this.message, {this.page = 1});

  @override
  final String message;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'TvShowWatchlistState.fetchDataFailure(message: $message, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchDataFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchDataFailureCopyWith<_$_FetchDataFailure> get copyWith =>
      __$$_FetchDataFailureCopyWithImpl<_$_FetchDataFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) fetchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        fetchDataSuccess,
    required TResult Function(String message, int page) fetchDataFailure,
  }) {
    return fetchDataFailure(message, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? fetchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult? Function(String message, int page)? fetchDataFailure,
  }) {
    return fetchDataFailure?.call(message, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? fetchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? fetchDataSuccess,
    TResult Function(String message, int page)? fetchDataFailure,
    required TResult orElse(),
  }) {
    if (fetchDataFailure != null) {
      return fetchDataFailure(message, page);
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

abstract class _FetchDataFailure implements TvShowWatchlistState {
  const factory _FetchDataFailure(final String message, {final int page}) =
      _$_FetchDataFailure;

  String get message;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_FetchDataFailureCopyWith<_$_FetchDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
