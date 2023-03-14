import 'dart:convert';

import 'package:core/common/constants.dart';
import 'package:core/common/exception.dart';
import 'package:http/http.dart' as http;

import '../models/tv_show_detail_model.dart';
import '../models/tv_show_model.dart';
import '../models/tv_show_response.dart';

abstract class TvShowRemoteDataSource {
  Future<List<TvShowModel>> getNowAiringTvShows([int page = 1]);

  Future<List<TvShowModel>> getPopularTvShows([int page = 1]);

  Future<List<TvShowModel>> getTopRatedTvShows([int page = 1]);

  Future<TvShowDetailModel> getTvShowDetail(int id);

  Future<List<TvShowModel>> getTvShowRecommendations(int id, [int page = 1]);

  Future<List<TvShowModel>> searchTvShows(String query, [int page = 1]);
}

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  final http.Client client;

  TvShowRemoteDataSourceImpl(this.client);

  @override
  Future<List<TvShowModel>> getNowAiringTvShows([int page = 1]) async {
    final response = await client
        .get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TvShowDetailModel> getTvShowDetail(int id) async {
    final response = await client.get(Uri.parse('$baseUrl/tv/$id?$apiKey'));

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
        .get(Uri.parse('$baseUrl/tv/$id/recommendations?$apiKey&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows([int page = 1]) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/popular?$apiKey&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShows([int page = 1]) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvShowModel>> searchTvShows(String query, [int page = 1]) async {
    final response = await client
        .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$query&page=$page'));

    if (response.statusCode == 200) {
      return TvShowResponse.fromJson(json.decode(response.body)).results;
    } else {
      throw ServerException();
    }
  }
}
