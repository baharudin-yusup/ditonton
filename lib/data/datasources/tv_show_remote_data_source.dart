import 'dart:convert';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/tv_show_response.dart';
import 'package:http/http.dart' as http;

import '../models/tv_show_detail_model.dart';
import '../models/tv_show_model.dart';

abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getNowAiringTvShows([int page = 1]);

  Future<List<TvShowModel>> getPopularTvShows([int page = 1]);

  Future<List<TvShowModel>> getTopRatedTvShows([int page = 1]);

  Future<TvShowDetailModel> getTvShowDetail(int id);

  Future<List<TvShowModel>> getTvShowRecommendations(int id, [int page = 1]);

  Future<List<TvShowModel>> searchTvShows(String query, [int page = 1]);
}

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  static const API_KEY = 'api_key=2174d146bb9c0eab47529b2e77d6b526';
  static const BASE_URL = 'https://api.themoviedb.org/3';

  final http.Client client;

  TvShowRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvShowModel>> getNowAiringTvShows([int page = 1]) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/on_the_air?$API_KEY&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvShowDetailModel> getTvShowDetail(int id) async {
    final response = await client.get(Uri.parse('$BASE_URL/tv/$id?$API_KEY'));

    if (response.statusCode == 200) {
      return TvShowDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getTvShowRecommendations(int id,
      [int page = 1]) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/$id/recommendations?$API_KEY&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows([int page = 1]) async {
    final response =
        await client.get(Uri.parse('$BASE_URL/tv/popular?$API_KEY&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShows([int page = 1]) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/tv/top_rated?$API_KEY&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> searchTvShows(String query, [int page = 1]) async {
    final response = await client
        .get(Uri.parse('$BASE_URL/search/tv?$API_KEY&query=$query&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }
}