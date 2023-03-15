import 'dart:convert';
import 'dart:io';

import 'package:core/common/constants.dart';
import 'package:core/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tv_show/data/models/models.dart';
import 'package:tv_show/data/sources/sources.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late TvShowRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  final page = 1;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvShowRemoteDataSourceImpl(mockHttpClient);
  });

  group('get now airing tv shows', () {
    final tTvShowList = TvShowResponse.fromJson(
            json.decode(readJson('dummy_data/tv_show_response.json')))
        .results;

    test('should return list of TvShow Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey&page=$page')))
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
              .get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey&page=$page')))
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

    test('should return list of tv_shows when response is success (200)',
        () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/popular?$apiKey&page=$page')))
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
              .get(Uri.parse('$baseUrl/tv/popular?$apiKey&page=$page')))
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

    test('should return list of tv_shows when response code is 200 ', () async {
      // arrange
      when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/top_rated?$apiKey&page=$page')))
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
              .get(Uri.parse('$baseUrl/tv/top_rated?$apiKey&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvShows();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get tv show detail', () {
    const tId = 1;
    final tTvShowDetail = TvShowDetailModel.fromJson(
        json.decode(readJson('dummy_data/tv_show_detail.json')));

    test('should return tv_show detail when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/tv_show_detail.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      // act
      final result = await dataSource.getTvShowDetail(tId);
      // assert
      expect(result, isA<TvShowDetailModel>());
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
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
    const tId = 1;

    test('should return list of TvShow Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(
              Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey&page=$page')))
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
      when(mockHttpClient.get(
              Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey&page=$page')))
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
    const tQuery = 'Spider';

    test('should return list of tv_shows when response code is 200', () async {
      // arrange
      when(mockHttpClient.get(
              Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery&page=$page')))
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
      when(mockHttpClient.get(
              Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery&page=$page')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchTvShows(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
