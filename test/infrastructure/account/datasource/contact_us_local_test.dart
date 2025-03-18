import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ContactUsLocalDataSource localDataSource;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    localDataSource = ContactUsLocalDataSource();
  });

  group('Contact Us Local DataSourcee Test', () {
    test(
      '=> submit',
      () async {
        final res = json.decode(
          await rootBundle.loadString(
            'assets/json/submit_contact_us/submitContactUsResponse.json',
          ),
        );
        final result = await localDataSource.submit();

        expect(
          result,
          res == 'Message sent successfully.',
        );
      },
    );
  });
}
