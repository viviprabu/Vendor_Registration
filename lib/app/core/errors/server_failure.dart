abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  final int? code;
  ServerFailure(this.message, {this.code});

  @override
  String toString() {
    return message;
  }
}

class GeneralFailure extends Failure {}
