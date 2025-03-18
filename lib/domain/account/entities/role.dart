import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';

@freezed
class Role with _$Role {
  const Role._();

  const factory Role({
    required String id,
    required String name,
    required RoleType type,
    required String description,
  }) = _Role;

  factory Role.empty() => Role(
        id: '',
        name: '',
        type: RoleType(''),
        description: '',
      );
}
