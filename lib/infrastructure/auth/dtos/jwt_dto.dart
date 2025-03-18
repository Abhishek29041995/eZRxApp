import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:hive/hive.dart';

part 'jwt_dto.g.dart';

@HiveType(typeId: 0)
class JWTDto {
  JWTDto({required this.access, required this.refresh});

  @HiveField(0)
  final String access;
  @HiveField(1)
  final String refresh;

  factory JWTDto.fromDomain(JWT access, JWT refresh) {
    return JWTDto(
      access: access.getOrCrash(),
      refresh: refresh.getOrDefaultValue(''),
    );
  }

  JWT toDomain() {
    return JWT(access);
  }
}
