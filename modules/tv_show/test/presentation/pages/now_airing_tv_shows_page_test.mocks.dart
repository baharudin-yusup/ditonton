// Mocks generated by Mockito 5.3.2 from annotations
// in tv_show/test/presentation/pages/now_airing_tv_shows_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_show/presentation/blocs/now_airing_tv_shows/now_airing_tv_shows_bloc.dart'
    as _i2;

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

class _FakeNowAiringTvShowsState_0 extends _i1.SmartFake
    implements _i2.NowAiringTvShowsState {
  _FakeNowAiringTvShowsState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NowAiringTvShowsBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlocType1 extends _i1.Mock implements _i2.NowAiringTvShowsBloc {
  @override
  _i2.NowAiringTvShowsState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeNowAiringTvShowsState_0(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeNowAiringTvShowsState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.NowAiringTvShowsState);
  @override
  _i3.Stream<_i2.NowAiringTvShowsState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.NowAiringTvShowsState>.empty(),
        returnValueForMissingStub:
            _i3.Stream<_i2.NowAiringTvShowsState>.empty(),
      ) as _i3.Stream<_i2.NowAiringTvShowsState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i2.NowAiringTvShowsEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i2.NowAiringTvShowsEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i2.NowAiringTvShowsState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i2.NowAiringTvShowsEvent>(
    _i4.EventHandler<E, _i2.NowAiringTvShowsState>? handler, {
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
          _i4.Transition<_i2.NowAiringTvShowsEvent, _i2.NowAiringTvShowsState>?
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
  void onChange(_i4.Change<_i2.NowAiringTvShowsState>? change) =>
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
