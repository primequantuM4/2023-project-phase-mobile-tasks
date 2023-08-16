import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';

class InputConverter {
  Either<Failure, DateTime> stringToDateTime(String str) {
    try {
      return Right(DateTime.parse(str));
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
