import 'package:core/data/helpers/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:tv_show/data/sources/sources.dart';
import 'package:tv_show/domain/repositories/repositories.dart';

@GenerateMocks([
  TvShowRepository,
  TvShowRemoteDataSource,
  TvShowLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
