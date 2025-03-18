import 'dart:convert';

import 'package:flutter/services.dart';

class ContactUsLocalDataSource {
  ContactUsLocalDataSource();

  Future<bool> submit() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/submit_contact_us/submitContactUsResponse.json',
      ),
    );

    return data == 'Message sent successfully.';
  }
}
