import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_name.freezed.dart';

@freezed
class CustomerName with _$CustomerName {
  const CustomerName._();

  const factory CustomerName({
    required String name1,
    required String name2,
    required String name3,
    required String name4,
  }) = _CustomerName;

  factory CustomerName.empty() => const CustomerName(
        name1: '',
        name2: '',
        name3: '',
        name4: '',
      );

  @override
  String toString() => '$name1 $name2 $name3 $name4';
}
