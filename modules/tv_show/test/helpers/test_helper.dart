import 'package:core/data/helpers/helpers.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:tv_show/data/sources/sources.dart';
import 'package:tv_show/domain/repositories/repositories.dart';

@GenerateMocks([
  TvShowRepository,
  TvShowRemoteDataSource,
  TvShowLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
