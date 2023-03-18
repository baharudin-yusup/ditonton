// coverage:ignore-start
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String? message]) : super(message ?? 'Unknown error');
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(dynamic exception) : super('$exception');
}
// coverage:ignore-end
