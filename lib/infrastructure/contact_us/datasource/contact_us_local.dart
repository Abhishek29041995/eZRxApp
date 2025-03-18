import 'dart:convert';

import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/infrastructure/contact_us/dtos/contact_us_details_dto.dart';
import 'package:flutter/services.dart';

class ContactUsDetailsLocalDataSource {
  Future<ContactUsDetails> getContactUsDetails(String country) async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/market_static_content/contact_us/contactUs${country}marketStaticContent.json',
      ),
    );

    return ContactUsDetailsDto.fromJson(res).toDomain;
  }
}
