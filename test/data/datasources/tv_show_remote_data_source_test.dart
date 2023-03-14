import 'dart:convert';
import 'dart:io';

import 'package:ditonton/data/datasources/tv_show_remote_data_source.dart';
import 'package:ditonton/data/models/tv_show_detail_model.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/data/models/tv_show_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../modules/core/lib/common/exception.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  const BASE_URL = 'https://api.themoviedb.org/3';
  const page = 1;

  late TvShowRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvShowRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get now airing tv shows', () {
    final tTvShowList = TvShowResponse.fromJson(
            json.decode(readJson('dummy_data/tv_show_response.json')))
        .results;

    test('should return list of $TvShowModel when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_response.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      // act
      final result = await dataSource.getNowAiringTvShows();
      // assert
      expect(result, equals(tTvShowList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getNowAiringTvShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get popular tv shows', () {
    final tTvShowList = TvShowResponse.fromJson(
            json.decode(readJson('dummy_data/tv_show_response.json')))
        .results;

    test('should return list of movies when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/popular?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_response.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      // act
      final result = await dataSource.getPopularTvShows();
      // assert
      expect(result, tTvShowList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/popular?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularTvShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get top rated tv shows', () {
    final tTvShowList = TvShowResponse.fromJson(
            json.decode(readJson('dummy_data/tv_show_response.json')))
        .results;

    test('should return list of movies when response code is 200 ', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_response.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      // act
      final result = await dataSource.getTopRatedTvShows();
      // assert
      expect(result, tTvShowList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv show detail', () {
    final tId = 1;
    final tTvShowDetail = TvShowDetailModel.fromJson(
        json.decode(readJson('dummy_data/tv_show_detail.json')));

    test('should return $TvShowDetailModel when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/tv_show_detail.json'), 200));
      // act
      final result = await dataSource.getTvShowDetail(tId);
      // assert
      expect(result.toJson(), equals(tTvShowDetail.toJson()));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$BASE_URL/tv/$tId?$API_KEY')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvShowDetail(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv show recommendations', () {
    final tTvShowList = TvShowResponse.fromJson(
            json.decode(readJson('dummy_data/tv_show_response.json')))
        .results;
    final tId = 1;

    test('should return list of Movie Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(
              '$BASE_URL/tv/$tId/recommendations?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_response.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      // act
      final result = await dataSource.getTvShowRecommendations(tId);
      // assert
      expect(result, equals(tTvShowList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(
              '$BASE_URL/tv/$tId/recommendations?$API_KEY&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTvShowRecommendations(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('search tv shows', () {
    final tSearchResult = TvShowResponse.fromJson(
            json.decode(readJson('dummy_data/tv_show_response.json')))
        .results;
    final tQuery = 'Spider';

    test('should return list of movies when response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(
              '$BASE_URL/search/tv?$API_KEY&query=$tQuery&page=$page')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_response.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      // act
      final result = await dataSource.searchTvShows(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(
              '$BASE_URL/search/tv?$API_KEY&query=$tQuery&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchTvShows(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
