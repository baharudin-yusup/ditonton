import 'package:ditonton/data/datasources/tv_show_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_show_remote_data_source.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import '../../modules/core/lib/data/helpers/database_helper.dart';
import '../../modules/movie/lib/data/sources/movie_local_data_source.dart';
import '../../modules/movie/lib/data/sources/movie_remote_data_source.dart';
import '../../modules/movie/lib/domain/repositories/movie_repository.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvShowRepository,
  TvShowRemoteDataSource,
  TvShowLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
