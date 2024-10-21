abstract class Failure {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message);

  String returnMessage() {
    return message;
  }
}

class GeneralFailure extends Failure {}
