class Failure {
  final String message;
  final int? statusCode;

  Failure(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = "No Internet Connection"]);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = "Server Error"]);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = "Cache Error"]);
}
