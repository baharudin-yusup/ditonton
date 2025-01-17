// Mocks generated by Mockito 5.3.2 from annotations
// in tv_show/test/presentation/blocs/tv_show_watchlist_status_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i11;
import 'package:core/common/failure.dart' as _i8;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_show/domain/entities/tv_show_detail.dart' as _i9;
import 'package:tv_show/domain/repositories/tv_show_repository.dart' as _i2;
import 'package:tv_show/domain/usecases/get_tv_show_watchlist_status.dart'
    as _i5;
import 'package:tv_show/domain/usecases/remove_tv_show_watchlist.dart' as _i10;
import 'package:tv_show/domain/usecases/save_tv_show_watchlist.dart' as _i7;
import 'package:tv_show/presentation/blocs/tv_show_watchlist/tv_show_watchlist_bloc.dart'
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

class _FakeTvShowRepository_0 extends _i1.SmartFake
    implements _i2.TvShowRepository {
  _FakeTvShowRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvShowWatchlistState_2 extends _i1.SmartFake
    implements _i4.TvShowWatchlistState {
  _FakeTvShowWatchlistState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetTvShowWatchlistStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsecase1 extends _i1.Mock implements _i5.GetTvShowWatchlistStatus {
  @override
  _i2.TvShowRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvShowRepository);
  @override
  _i6.Future<bool> call(int? id) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [id],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}

/// A class which mocks [SaveTvShowWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsecase2 extends _i1.Mock implements _i7.SaveTvShowWatchlist {
  @override
  _i2.TvShowRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvShowRepository);
  @override
  _i6.Future<_i3.Either<_i8.Failure, String>> call(_i9.TvShowDetail? tvShow) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [tvShow],
        ),
        returnValue: _i6.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #call,
            [tvShow],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i8.Failure, String>>.value(
                _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #call,
            [tvShow],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i8.Failure, String>>);
}

/// A class which mocks [RemoveTvShowWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsecase3 extends _i1.Mock implements _i10.RemoveTvShowWatchlist {
  @override
  _i2.TvShowRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeTvShowRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TvShowRepository);
  @override
  _i6.Future<_i3.Either<_i8.Failure, String>> call(_i9.TvShowDetail? tvShow) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [tvShow],
        ),
        returnValue: _i6.Future<_i3.Either<_i8.Failure, String>>.value(
            _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #call,
            [tvShow],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<_i8.Failure, String>>.value(
                _FakeEither_1<_i8.Failure, String>(
          this,
          Invocation.method(
            #call,
            [tvShow],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i8.Failure, String>>);
}

/// A class which mocks [TvShowWatchlistBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistBloc extends _i1.Mock implements _i4.TvShowWatchlistBloc {
  @override
  _i4.TvShowWatchlistState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvShowWatchlistState_2(
          this,
          Invocation.getter(#state),
        ),
        returnValueForMissingStub: _FakeTvShowWatchlistState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.TvShowWatchlistState);
  @override
  _i6.Stream<_i4.TvShowWatchlistState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i4.TvShowWatchlistState>.empty(),
        returnValueForMissingStub: _i6.Stream<_i4.TvShowWatchlistState>.empty(),
      ) as _i6.Stream<_i4.TvShowWatchlistState>);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void add(_i4.TvShowWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onEvent(_i4.TvShowWatchlistEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void emit(_i4.TvShowWatchlistState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void on<E extends _i4.TvShowWatchlistEvent>(
    _i11.EventHandler<E, _i4.TvShowWatchlistState>? handler, {
    _i11.EventTransformer<E>? transformer,
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
          _i11.Transition<_i4.TvShowWatchlistEvent, _i4.TvShowWatchlistState>?
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
  void onChange(_i11.Change<_i4.TvShowWatchlistState>? change) =>
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
