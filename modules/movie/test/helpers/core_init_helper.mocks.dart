// Mocks generated by Mockito 5.3.2 from annotations
// in movie/test/helpers/core_init_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i15;

import 'package:core/common/failure.dart' as _i7;
import 'package:core/data/helpers/database_helper.dart' as _i10;
import 'package:core/data/models/watchlist_table.dart' as _i11;
import 'package:core/data/sources/analytic_remote_data_source.dart' as _i9;
import 'package:core/domain/repositories/analytic_repository.dart' as _i8;
import 'package:core/domain/usecases/log_selected_content.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/src/base_request.dart' as _i13;
import 'package:http/src/io_client.dart' as _i12;
import 'package:http/src/io_streamed_response.dart' as _i3;
import 'package:http/src/response.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

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

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_1 extends _i1.SmartFake
    implements _i3.IOStreamedResponse {
  _FakeIOStreamedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LogSelectedContent].
///
/// See the documentation for Mockito's code generation for more information.
class MockLogSelectedContent extends _i1.Mock
    implements _i5.LogSelectedContent {
  MockLogSelectedContent() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i2.Unit>> call({
    required String? contentType,
    required String? contentId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {
            #contentType: contentType,
            #contentId: contentId,
          },
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i7.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #call,
            [],
            {
              #contentType: contentType,
              #contentId: contentId,
            },
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i2.Unit>>);
}

/// A class which mocks [AnalyticRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnalyticRepository extends _i1.Mock
    implements _i8.AnalyticRepository {
  MockAnalyticRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i2.Unit>> logSelectedContent(
    String? contentType,
    String? contentId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #logSelectedContent,
          [
            contentType,
            contentId,
          ],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i7.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #logSelectedContent,
            [
              contentType,
              contentId,
            ],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i2.Unit>>);
}

/// A class which mocks [AnalyticRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnalyticRemoteDataSource extends _i1.Mock
    implements _i9.AnalyticRemoteDataSource {
  MockAnalyticRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<void> logSelectedContent(
    String? contentType,
    String? contentId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #logSelectedContent,
          [
            contentType,
            contentId,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i10.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<int> insertWatchlist(_i11.WatchlistTable? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlist],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlist(_i11.WatchlistTable? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [watchlist],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getWatchlistById(
    int? id,
    String? type,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [
            id,
            type,
          ],
        ),
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlist(String? type) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [type],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i12.IOClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.IOStreamedResponse> send(_i13.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i6.Future<_i3.IOStreamedResponse>.value(_FakeIOStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i6.Future<_i3.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i6.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<_i15.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i6.Future<_i15.Uint8List>.value(_i15.Uint8List(0)),
      ) as _i6.Future<_i15.Uint8List>);
}
