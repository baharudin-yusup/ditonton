// Mocks generated by Mockito 5.3.2 from annotations
// in tv_show/test/presentation/pages/tv_show_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_show/presentation/blocs/tv_show_detail/tv_show_detail_bloc.dart'
    as _i2;
import 'package:tv_show/presentation/blocs/tv_show_recommendations/tv_show_recommendations_bloc.dart'
    as _i3;
import 'package:tv_show/presentation/blocs/tv_show_watchlist/tv_show_watchlist_bloc.dart'
    as _i5;
import 'package:tv_show/presentation/blocs/tv_show_watchlist_status/tv_show_watchlist_status_bloc.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTvShowDetailState_0 extends _i1.SmartFake
    implements _i2.TvShowDetailState {
  _FakeTvShowDetailState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvShowRecommendationsState_1 extends _i1.SmartFake
    implements _i3.TvShowRecommendationsState {
  _FakeTvShowRecommendationsState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvShowWatchlistStatusState_2 extends _i1.SmartFake
    implements _i4.TvShowWatchlistStatusState {
  _FakeTvShowWatchlistStatusState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvShowWatchlistState_3 extends _i1.SmartFake
    implements _i5.TvShowWatchlistState {
  _FakeTvShowWatchlistState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvShowDetailBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType1 extends _i1.Mock implements _i2.TvShowDetailBloc {
  @override
  _i2.TvShowDetailState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvShowDetailState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeTvShowDetailState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.TvShowDetailState);
  @override
  _i6.Stream<_i2.TvShowDetailState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i2.TvShowDetailState>.empty(),
        returnValueForMissingStub: _i6.Stream<_i2.TvShowDetailState>.empty(),
      ) as _i6.Stream<_i2.TvShowDetailState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i2.TvShowDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.TvShowDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.TvShowDetailState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.TvShowDetailEvent>(
    _i7.EventHandler<E, _i2.TvShowDetailState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i7.Transition<_i2.TvShowDetailEvent, _i2.TvShowDetailState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i2.TvShowDetailState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TvShowRecommendationsBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType2 extends _i1.Mock implements _i3.TvShowRecommendationsBloc {
  @override
  _i3.TvShowRecommendationsState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvShowRecommendationsState_1(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeTvShowRecommendationsState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.TvShowRecommendationsState);
  @override
  _i6.Stream<_i3.TvShowRecommendationsState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i3.TvShowRecommendationsState>.empty(),
        returnValueForMissingStub:
            _i6.Stream<_i3.TvShowRecommendationsState>.empty(),
      ) as _i6.Stream<_i3.TvShowRecommendationsState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i3.TvShowRecommendationsEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i3.TvShowRecommendationsEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i3.TvShowRecommendationsState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i3.TvShowRecommendationsEvent>(
    _i7.EventHandler<E, _i3.TvShowRecommendationsState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i7.Transition<_i3.TvShowRecommendationsEvent,
                  _i3.TvShowRecommendationsState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i3.TvShowRecommendationsState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TvShowWatchlistStatusBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType3 extends _i1.Mock implements _i4.TvShowWatchlistStatusBloc {
  @override
  _i4.TvShowWatchlistStatusState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvShowWatchlistStatusState_2(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeTvShowWatchlistStatusState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.TvShowWatchlistStatusState);
  @override
  _i6.Stream<_i4.TvShowWatchlistStatusState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i4.TvShowWatchlistStatusState>.empty(),
        returnValueForMissingStub:
            _i6.Stream<_i4.TvShowWatchlistStatusState>.empty(),
      ) as _i6.Stream<_i4.TvShowWatchlistStatusState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i4.TvShowWatchlistStatusEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i4.TvShowWatchlistStatusEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i4.TvShowWatchlistStatusState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i4.TvShowWatchlistStatusEvent>(
    _i7.EventHandler<E, _i4.TvShowWatchlistStatusState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i7.Transition<_i4.TvShowWatchlistStatusEvent,
                  _i4.TvShowWatchlistStatusState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i4.TvShowWatchlistStatusState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [TvShowWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType4 extends _i1.Mock implements _i5.TvShowWatchlistBloc {
  @override
  _i5.TvShowWatchlistState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvShowWatchlistState_3(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeTvShowWatchlistState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i5.TvShowWatchlistState);
  @override
  _i6.Stream<_i5.TvShowWatchlistState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i5.TvShowWatchlistState>.empty(),
        returnValueForMissingStub: _i6.Stream<_i5.TvShowWatchlistState>.empty(),
      ) as _i6.Stream<_i5.TvShowWatchlistState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i5.TvShowWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i5.TvShowWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i5.TvShowWatchlistState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i5.TvShowWatchlistEvent>(
    _i7.EventHandler<E, _i5.TvShowWatchlistState>? handler, {
    _i7.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onTransition(
          _i7.Transition<_i5.TvShowWatchlistEvent, _i5.TvShowWatchlistState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  void onChange(_i7.Change<_i5.TvShowWatchlistState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}