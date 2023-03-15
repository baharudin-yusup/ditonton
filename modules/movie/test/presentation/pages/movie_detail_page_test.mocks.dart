// Mocks generated by Mockito 5.3.2 from annotations
// in movie/test/presentation/pages/movie_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/movie.dart' as _i2;

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

class _FakeMovieDetailState_0 extends _i1.SmartFake
    implements _i2.MovieDetailState {
  _FakeMovieDetailState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieRecommendationsState_1 extends _i1.SmartFake
    implements _i2.MovieRecommendationsState {
  _FakeMovieRecommendationsState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieWatchlistStatusState_2 extends _i1.SmartFake
    implements _i2.MovieWatchlistStatusState {
  _FakeMovieWatchlistStatusState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieWatchlistState_3 extends _i1.SmartFake
    implements _i2.MovieWatchlistState {
  _FakeMovieWatchlistState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieDetailBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType1 extends _i1.Mock implements _i2.MovieDetailBloc {
  @override
  _i2.MovieDetailState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMovieDetailState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeMovieDetailState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.MovieDetailState);
  @override
  _i3.Stream<_i2.MovieDetailState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.MovieDetailState>.empty(),
        returnValueForMissingStub: _i3.Stream<_i2.MovieDetailState>.empty(),
      ) as _i3.Stream<_i2.MovieDetailState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i2.MovieDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.MovieDetailEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.MovieDetailState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.MovieDetailEvent>(
    _i4.EventHandler<E, _i2.MovieDetailState>? handler, {
    _i4.EventTransformer<E>? transformer,
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
          _i4.Transition<_i2.MovieDetailEvent, _i2.MovieDetailState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  void onChange(_i4.Change<_i2.MovieDetailState>? change) => super.noSuchMethod(
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

/// A class which mocks [MovieRecommendationsBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType2 extends _i1.Mock implements _i2.MovieRecommendationsBloc {
  @override
  _i2.MovieRecommendationsState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMovieRecommendationsState_1(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeMovieRecommendationsState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.MovieRecommendationsState);
  @override
  _i3.Stream<_i2.MovieRecommendationsState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.MovieRecommendationsState>.empty(),
        returnValueForMissingStub:
            _i3.Stream<_i2.MovieRecommendationsState>.empty(),
      ) as _i3.Stream<_i2.MovieRecommendationsState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i2.MovieRecommendationsEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.MovieRecommendationsEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.MovieRecommendationsState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.MovieRecommendationsEvent>(
    _i4.EventHandler<E, _i2.MovieRecommendationsState>? handler, {
    _i4.EventTransformer<E>? transformer,
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
          _i4.Transition<_i2.MovieRecommendationsEvent,
                  _i2.MovieRecommendationsState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  void onChange(_i4.Change<_i2.MovieRecommendationsState>? change) =>
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

/// A class which mocks [MovieWatchlistStatusBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType3 extends _i1.Mock implements _i2.MovieWatchlistStatusBloc {
  @override
  _i2.MovieWatchlistStatusState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMovieWatchlistStatusState_2(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeMovieWatchlistStatusState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.MovieWatchlistStatusState);
  @override
  _i3.Stream<_i2.MovieWatchlistStatusState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.MovieWatchlistStatusState>.empty(),
        returnValueForMissingStub:
            _i3.Stream<_i2.MovieWatchlistStatusState>.empty(),
      ) as _i3.Stream<_i2.MovieWatchlistStatusState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i2.MovieWatchlistStatusEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.MovieWatchlistStatusEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.MovieWatchlistStatusState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.MovieWatchlistStatusEvent>(
    _i4.EventHandler<E, _i2.MovieWatchlistStatusState>? handler, {
    _i4.EventTransformer<E>? transformer,
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
          _i4.Transition<_i2.MovieWatchlistStatusEvent,
                  _i2.MovieWatchlistStatusState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  void onChange(_i4.Change<_i2.MovieWatchlistStatusState>? change) =>
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

/// A class which mocks [MovieWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType4 extends _i1.Mock implements _i2.MovieWatchlistBloc {
  @override
  _i2.MovieWatchlistState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeMovieWatchlistState_3(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeMovieWatchlistState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.MovieWatchlistState);
  @override
  _i3.Stream<_i2.MovieWatchlistState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.MovieWatchlistState>.empty(),
        returnValueForMissingStub: _i3.Stream<_i2.MovieWatchlistState>.empty(),
      ) as _i3.Stream<_i2.MovieWatchlistState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i2.MovieWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.MovieWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.MovieWatchlistState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.MovieWatchlistEvent>(
    _i4.EventHandler<E, _i2.MovieWatchlistState>? handler, {
    _i4.EventTransformer<E>? transformer,
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
          _i4.Transition<_i2.MovieWatchlistEvent, _i2.MovieWatchlistState>?
              transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  void onChange(_i4.Change<_i2.MovieWatchlistState>? change) =>
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