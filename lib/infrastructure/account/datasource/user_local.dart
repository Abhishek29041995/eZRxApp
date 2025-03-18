import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/setting_tc_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:flutter/services.dart';

class UserLocalDataSource {
  final String rootAdminToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY2MzQwOTAzNiwiaWF0IjoxNjYzMzIyNjM2LCJpZCI6MTE0NjEsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjYwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19XX1dLCJyb2xlIjoiWlAgQWRtaW4iLCJzYWxlc09yZ3MiOlsiMjYwMSJdLCJ1c2VybmFtZSI6ImV6cnh0ZXN0MDUifQ.MakZTQ3JUVqeRuXQcBU1cUKmHZft5AmFPJDvuG4DjlA';
  final TokenStorage tokenStorage;
  UserLocalDataSource({required this.tokenStorage});

  Future<User> getUser() async {
    final token = await tokenStorage.get();
    final data = json.decode(
      token.access == rootAdminToken || token.access.isEmpty
          ? await rootBundle.loadString('assets/json/user/userResponse.json')
          : await rootBundle.loadString('assets/json/proxy_user/proxyUserResponse.json'),
    );

    return UserDto.fromJson(data['data']['user']).toDomain();
  }

  Future<SettingTc> updateUserTC() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/tnc_date/tncdateUpdateResponse.json'),
    );

    return SettingTcDto.fromJson(data['data']).toDomain();
  }

  Future<bool> updatePrivacyControl() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/common/updatePrivacyControlResponse.json',
      ),
    );

    return data == 'Successfully updated the privacy controls';
  }

  Future<DocumentType> updateSelectedOrderType() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/update_selected_order_type/updateSelectedOrderTypeResponse.json',
      ),
    );

    return DocumentType(data['data']['updateSelectedOrderType'] as String);
  }
}
