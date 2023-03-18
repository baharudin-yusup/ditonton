import 'package:core/data/helpers/helpers.dart';
import 'package:core/domain/repositories/analytic_repository.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/data/sources/sources.dart';
import 'package:movie/domain/repositories/repositories.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,

  /// Core module
  DatabaseHelper,
  IOClient,
  AnalyticRepository,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
