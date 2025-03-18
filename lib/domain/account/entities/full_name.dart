import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'full_name.freezed.dart';

@freezed
class FullName with _$FullName {
  const FullName._();

  const factory FullName({
    required String firstName,
    required String lastName,
  }) = _FullName;

  factory FullName.empty() => const FullName(
        firstName: '',
        lastName: '',
      );

  @override
  String toString() => '$firstName, $lastName';

  String shortForm() {
    if (firstName.isEmpty) return '';
    if (firstName.length <= 1 || lastName.length <= 1) return toString();

    return '${firstName[0].toUpperCase()}${lastName[0].toUpperCase()}';
  }

  String get displayFullName => '$firstName $lastName'.trim();

  String get toTitleCase {
    if (displayFullName.isEmpty) return '';

    return displayFullName
        .split(' ')
        .map(
          (word) =>
              word[0].toUpperCase() +
              word.characters.getRange(1).string.toLowerCase(),
        )
        .join(' ');
  }
}
