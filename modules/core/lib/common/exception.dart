// coverage:ignore-start
class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}
// coverage:ignore-end
