import 'dart:convert';
import 'package:flutter/services.dart';

class EZCSTicketLocalDataSource {
  EZCSTicketLocalDataSource();

  Future<bool> submitTicket() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/submitTicketResponse.json'),
    );

    return res['data']['submitClaim']['success'];
  }
}
