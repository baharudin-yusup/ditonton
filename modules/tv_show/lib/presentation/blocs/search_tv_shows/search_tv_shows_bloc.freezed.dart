// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tv_shows_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchTvShowsEvent {
  String get query => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, int page) searchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, int page)? searchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, int page)? searchDataStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchDataStarted value) searchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchDataStarted value)? searchDataStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchDataStarted value)? searchDataStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchTvShowsEventCopyWith<SearchTvShowsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTvShowsEventCopyWith<$Res> {
  factory $SearchTvShowsEventCopyWith(
          SearchTvShowsEvent value, $Res Function(SearchTvShowsEvent) then) =
      _$SearchTvShowsEventCopyWithImpl<$Res, SearchTvShowsEvent>;
  @useResult
  $Res call({String query, int page});
}

/// @nodoc
class _$SearchTvShowsEventCopyWithImpl<$Res, $Val extends SearchTvShowsEvent>
    implements $SearchTvShowsEventCopyWith<$Res> {
  _$SearchTvShowsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchDataStartedCopyWith<$Res>
    implements $SearchTvShowsEventCopyWith<$Res> {
  factory _$$_SearchDataStartedCopyWith(_$_SearchDataStarted value,
          $Res Function(_$_SearchDataStarted) then) =
      __$$_SearchDataStartedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, int page});
}

/// @nodoc
class __$$_SearchDataStartedCopyWithImpl<$Res>
    extends _$SearchTvShowsEventCopyWithImpl<$Res, _$_SearchDataStarted>
    implements _$$_SearchDataStartedCopyWith<$Res> {
  __$$_SearchDataStartedCopyWithImpl(
      _$_SearchDataStarted _value, $Res Function(_$_SearchDataStarted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? page = null,
  }) {
    return _then(_$_SearchDataStarted(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SearchDataStarted implements _SearchDataStarted {
  const _$_SearchDataStarted({required this.query, this.page = 1});

  @override
  final String query;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'SearchTvShowsEvent.searchDataStarted(query: $query, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchDataStarted &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataStartedCopyWith<_$_SearchDataStarted> get copyWith =>
      __$$_SearchDataStartedCopyWithImpl<_$_SearchDataStarted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, int page) searchDataStarted,
  }) {
    return searchDataStarted(query, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, int page)? searchDataStarted,
  }) {
    return searchDataStarted?.call(query, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, int page)? searchDataStarted,
    required TResult orElse(),
  }) {
    if (searchDataStarted != null) {
      return searchDataStarted(query, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchDataStarted value) searchDataStarted,
  }) {
    return searchDataStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchDataStarted value)? searchDataStarted,
  }) {
    return searchDataStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchDataStarted value)? searchDataStarted,
    required TResult orElse(),
  }) {
    if (searchDataStarted != null) {
      return searchDataStarted(this);
    }
    return orElse();
  }
}

abstract class _SearchDataStarted implements SearchTvShowsEvent {
  const factory _SearchDataStarted(
      {required final String query, final int page}) = _$_SearchDataStarted;

  @override
  String get query;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataStartedCopyWith<_$_SearchDataStarted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchTvShowsState {
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) searchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        searchDataSuccess,
    required TResult Function(String message, int page) searchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? searchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult? Function(String message, int page)? searchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? searchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult Function(String message, int page)? searchDataFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchDataInProgress value) searchDataInProgress,
    required TResult Function(_SearchDataSuccess value) searchDataSuccess,
    required TResult Function(_SearchDataFailure value) searchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult? Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult? Function(_SearchDataFailure value)? searchDataFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult Function(_SearchDataFailure value)? searchDataFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchTvShowsStateCopyWith<SearchTvShowsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTvShowsStateCopyWith<$Res> {
  factory $SearchTvShowsStateCopyWith(
          SearchTvShowsState value, $Res Function(SearchTvShowsState) then) =
      _$SearchTvShowsStateCopyWithImpl<$Res, SearchTvShowsState>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class _$SearchTvShowsStateCopyWithImpl<$Res, $Val extends SearchTvShowsState>
    implements $SearchTvShowsStateCopyWith<$Res> {
  _$SearchTvShowsStateCopyWithImpl(this._value, this._then);

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
    implements $SearchTvShowsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SearchTvShowsStateCopyWithImpl<$Res, _$_Initial>
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
    return 'SearchTvShowsState.initial(page: $page)';
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
    required TResult Function(int page) searchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        searchDataSuccess,
    required TResult Function(String message, int page) searchDataFailure,
  }) {
    return initial(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? searchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult? Function(String message, int page)? searchDataFailure,
  }) {
    return initial?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? searchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult Function(String message, int page)? searchDataFailure,
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
    required TResult Function(_SearchDataInProgress value) searchDataInProgress,
    required TResult Function(_SearchDataSuccess value) searchDataSuccess,
    required TResult Function(_SearchDataFailure value) searchDataFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult? Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult? Function(_SearchDataFailure value)? searchDataFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult Function(_SearchDataFailure value)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchTvShowsState {
  const factory _Initial([final int page]) = _$_Initial;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchDataInProgressCopyWith<$Res>
    implements $SearchTvShowsStateCopyWith<$Res> {
  factory _$$_SearchDataInProgressCopyWith(_$_SearchDataInProgress value,
          $Res Function(_$_SearchDataInProgress) then) =
      __$$_SearchDataInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$_SearchDataInProgressCopyWithImpl<$Res>
    extends _$SearchTvShowsStateCopyWithImpl<$Res, _$_SearchDataInProgress>
    implements _$$_SearchDataInProgressCopyWith<$Res> {
  __$$_SearchDataInProgressCopyWithImpl(_$_SearchDataInProgress _value,
      $Res Function(_$_SearchDataInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$_SearchDataInProgress(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SearchDataInProgress implements _SearchDataInProgress {
  const _$_SearchDataInProgress({this.page = 1});

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'SearchTvShowsState.searchDataInProgress(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchDataInProgress &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataInProgressCopyWith<_$_SearchDataInProgress> get copyWith =>
      __$$_SearchDataInProgressCopyWithImpl<_$_SearchDataInProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) searchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        searchDataSuccess,
    required TResult Function(String message, int page) searchDataFailure,
  }) {
    return searchDataInProgress(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? searchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult? Function(String message, int page)? searchDataFailure,
  }) {
    return searchDataInProgress?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? searchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult Function(String message, int page)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (searchDataInProgress != null) {
      return searchDataInProgress(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchDataInProgress value) searchDataInProgress,
    required TResult Function(_SearchDataSuccess value) searchDataSuccess,
    required TResult Function(_SearchDataFailure value) searchDataFailure,
  }) {
    return searchDataInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult? Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult? Function(_SearchDataFailure value)? searchDataFailure,
  }) {
    return searchDataInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult Function(_SearchDataFailure value)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (searchDataInProgress != null) {
      return searchDataInProgress(this);
    }
    return orElse();
  }
}

abstract class _SearchDataInProgress implements SearchTvShowsState {
  const factory _SearchDataInProgress({final int page}) =
      _$_SearchDataInProgress;

  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataInProgressCopyWith<_$_SearchDataInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchDataSuccessCopyWith<$Res>
    implements $SearchTvShowsStateCopyWith<$Res> {
  factory _$$_SearchDataSuccessCopyWith(_$_SearchDataSuccess value,
          $Res Function(_$_SearchDataSuccess) then) =
      __$$_SearchDataSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Watchlist> movies, int page});
}

/// @nodoc
class __$$_SearchDataSuccessCopyWithImpl<$Res>
    extends _$SearchTvShowsStateCopyWithImpl<$Res, _$_SearchDataSuccess>
    implements _$$_SearchDataSuccessCopyWith<$Res> {
  __$$_SearchDataSuccessCopyWithImpl(
      _$_SearchDataSuccess _value, $Res Function(_$_SearchDataSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? page = null,
  }) {
    return _then(_$_SearchDataSuccess(
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

class _$_SearchDataSuccess implements _SearchDataSuccess {
  const _$_SearchDataSuccess(final List<Watchlist> movies, {this.page = 1})
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
    return 'SearchTvShowsState.searchDataSuccess(movies: $movies, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchDataSuccess &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataSuccessCopyWith<_$_SearchDataSuccess> get copyWith =>
      __$$_SearchDataSuccessCopyWithImpl<_$_SearchDataSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) searchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        searchDataSuccess,
    required TResult Function(String message, int page) searchDataFailure,
  }) {
    return searchDataSuccess(movies, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? searchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult? Function(String message, int page)? searchDataFailure,
  }) {
    return searchDataSuccess?.call(movies, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? searchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult Function(String message, int page)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (searchDataSuccess != null) {
      return searchDataSuccess(movies, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchDataInProgress value) searchDataInProgress,
    required TResult Function(_SearchDataSuccess value) searchDataSuccess,
    required TResult Function(_SearchDataFailure value) searchDataFailure,
  }) {
    return searchDataSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult? Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult? Function(_SearchDataFailure value)? searchDataFailure,
  }) {
    return searchDataSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult Function(_SearchDataFailure value)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (searchDataSuccess != null) {
      return searchDataSuccess(this);
    }
    return orElse();
  }
}

abstract class _SearchDataSuccess implements SearchTvShowsState {
  const factory _SearchDataSuccess(final List<Watchlist> movies,
      {final int page}) = _$_SearchDataSuccess;

  List<Watchlist> get movies;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataSuccessCopyWith<_$_SearchDataSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchDataFailureCopyWith<$Res>
    implements $SearchTvShowsStateCopyWith<$Res> {
  factory _$$_SearchDataFailureCopyWith(_$_SearchDataFailure value,
          $Res Function(_$_SearchDataFailure) then) =
      __$$_SearchDataFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int page});
}

/// @nodoc
class __$$_SearchDataFailureCopyWithImpl<$Res>
    extends _$SearchTvShowsStateCopyWithImpl<$Res, _$_SearchDataFailure>
    implements _$$_SearchDataFailureCopyWith<$Res> {
  __$$_SearchDataFailureCopyWithImpl(
      _$_SearchDataFailure _value, $Res Function(_$_SearchDataFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? page = null,
  }) {
    return _then(_$_SearchDataFailure(
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

class _$_SearchDataFailure implements _SearchDataFailure {
  const _$_SearchDataFailure(this.message, {this.page = 1});

  @override
  final String message;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'SearchTvShowsState.searchDataFailure(message: $message, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchDataFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchDataFailureCopyWith<_$_SearchDataFailure> get copyWith =>
      __$$_SearchDataFailureCopyWithImpl<_$_SearchDataFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) initial,
    required TResult Function(int page) searchDataInProgress,
    required TResult Function(List<Watchlist> movies, int page)
        searchDataSuccess,
    required TResult Function(String message, int page) searchDataFailure,
  }) {
    return searchDataFailure(message, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? initial,
    TResult? Function(int page)? searchDataInProgress,
    TResult? Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult? Function(String message, int page)? searchDataFailure,
  }) {
    return searchDataFailure?.call(message, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? initial,
    TResult Function(int page)? searchDataInProgress,
    TResult Function(List<Watchlist> movies, int page)? searchDataSuccess,
    TResult Function(String message, int page)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (searchDataFailure != null) {
      return searchDataFailure(message, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SearchDataInProgress value) searchDataInProgress,
    required TResult Function(_SearchDataSuccess value) searchDataSuccess,
    required TResult Function(_SearchDataFailure value) searchDataFailure,
  }) {
    return searchDataFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult? Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult? Function(_SearchDataFailure value)? searchDataFailure,
  }) {
    return searchDataFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SearchDataInProgress value)? searchDataInProgress,
    TResult Function(_SearchDataSuccess value)? searchDataSuccess,
    TResult Function(_SearchDataFailure value)? searchDataFailure,
    required TResult orElse(),
  }) {
    if (searchDataFailure != null) {
      return searchDataFailure(this);
    }
    return orElse();
  }
}

abstract class _SearchDataFailure implements SearchTvShowsState {
  const factory _SearchDataFailure(final String message, {final int page}) =
      _$_SearchDataFailure;

  String get message;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_SearchDataFailureCopyWith<_$_SearchDataFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
