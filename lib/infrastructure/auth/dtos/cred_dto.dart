import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:hive/hive.dart';

part 'cred_dto.g.dart';

@HiveType(typeId: 1)
class CredDto {
  CredDto({required this.username, required this.password});

  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  Cred toDomain() {
    return Cred(
      username: Username(username),
      password: Password.login(password),
    );
  }
}
