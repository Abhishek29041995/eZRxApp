import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_exception.freezed.dart';

@freezed
class UserException with _$UserException {
  const factory UserException.userNotFound() = _UserNotFound;
}
