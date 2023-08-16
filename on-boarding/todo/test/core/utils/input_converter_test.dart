import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/core/utils/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToDateTime', () {
    test('Should return a DateTime when the string represents a DateTime value',
        () async {
      final str = '2023-10-10';
      final result = inputConverter.stringToDateTime(str);

      expect(result, Right(DateTime.parse('2023-10-10')));
    });
    test('''Should return a failure when the
     string represents a value other than DateTime''', () async {
      final str = 'abcd';
      final result = inputConverter.stringToDateTime(str);
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
