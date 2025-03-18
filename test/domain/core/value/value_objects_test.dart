import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RangeValue value object', () {
    test('has valid value', () {
      final range = RangeValue('0.0');
      expect(range.value.isRight(), true);
    });

    test('has valid value 2', () {
      final range = RangeValue('26');
      expect(range.value.isRight(), true);
    });

    test('has valid value 3', () {
      final range = RangeValue('26.3421');
      expect(range.value.isRight(), true);
    });

    test('has valid value 4', () {
      final range = RangeValue('-10');
      expect(range.value.isRight(), true);
    });

    test('has invalid value', () {
      final range = RangeValue('h');
      expect(range.value.isLeft(), true);
    });

    test('check for valid range', () {
      final from = RangeValue('0.0');
      final to = RangeValue('10.0');
      final isValid = RangeValue.checkIfRangeIsValid(from, to);
      expect(isValid, true);
    });

    test('check for valid range 2', () {
      final from = RangeValue('1.0');
      final to = RangeValue('1.0');
      final isValid = RangeValue.checkIfRangeIsValid(from, to);
      expect(isValid, true);
    });

    test('check for invalid range', () {
      final from = RangeValue('1.0');
      final to = RangeValue('0.0');
      final isValid = RangeValue.checkIfRangeIsValid(from, to);
      expect(isValid, false);
    });

    // test('check for empty range', () {
    //   final from = RangeValue('');
    //   final to = RangeValue('');
    //   final isEmpty = RangeValue.checkIfRangeIsEmpty(from, to);
    //   expect(isEmpty, true);
    // });

    // test('check for not empty range', () {
    //   final from = RangeValue('13');
    //   final to = RangeValue('13');
    //   final isEmpty = RangeValue.checkIfRangeIsEmpty(from, to);
    //   expect(isEmpty, false);
    // });

    test('check for one empty range', () {
      final from = RangeValue('');
      final to = RangeValue('13');
      final isEmpty = RangeValue.checkIfAnyIsEmpty(from, to);
      expect(isEmpty, true);
    });

    test('check for one empty range 2', () {
      final from = RangeValue('12');
      final to = RangeValue('');
      final isEmpty = RangeValue.checkIfAnyIsEmpty(from, to);
      expect(isEmpty, true);
    });

    test('check for not even one empty range', () {
      final from = RangeValue('12');
      final to = RangeValue('12');
      final isEmpty = RangeValue.checkIfAnyIsEmpty(from, to);
      expect(isEmpty, false);
    });
  });

  group('Datatime String value check', () {
    test('returns NA if datestring is 00000', () {
      final date = DateTimeStringValue('00000000');
      expect(date.dateOrNaString, 'NA');
    });
  });
}
