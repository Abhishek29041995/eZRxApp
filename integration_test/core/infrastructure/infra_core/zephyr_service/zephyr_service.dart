import 'package:test_api/src/backend/invoker.dart';
import 'package:test_api/src/backend/state.dart';


class ZephyrService {
  final Map<String, Result> _testCase = {};

  Map<String, Result> get getTestCases => _testCase;

  void setNameAndStatus() {
    final tcName =
        Invoker.current?.liveTest.individualName.split(' | ').first ??
            'InValid';
    _testCase[tcName] =
        Invoker.current?.liveTest.state.result ?? Result.failure;
  }

  String getCycleID(CycleKeyId id) {
    const value = 'EZRX-R';
    switch (id) {
      case CycleKeyId.myClient:
        return '${value}12';
      case CycleKeyId.myExternalSR:
        return '${value}13';
      case CycleKeyId.phClient:
        return '${value}14';
      case CycleKeyId.phExternalSR:
        return '${value}24';
      case CycleKeyId.twClient:
        return '${value}15';
      case CycleKeyId.twExternalSR:
        return '${value}25';
      case CycleKeyId.thClient:
        return '${value}16';
      case CycleKeyId.thExternalSR:
        return '${value}26';
      case CycleKeyId.vnClient:
        return '${value}17';
      case CycleKeyId.vnExternalSR:
        return '${value}27';
      case CycleKeyId.sgClient:
        return '${value}18';
      case CycleKeyId.sgExternalSR:
        return '${value}28';
      case CycleKeyId.khClient:
        return '${value}19';
      case CycleKeyId.khExternalSR:
        return '${value}29';
      case CycleKeyId.mmClient:
        return '${value}20';
      case CycleKeyId.mmExternalSR:
        return '${value}30';
      case CycleKeyId.idClient:
        return '${value}21';
      case CycleKeyId.idExternalSR:
        return '${value}31';
      case CycleKeyId.krClient:
        return '${value}22';
      case CycleKeyId.krExternalSR:
        return '${value}32';
      case CycleKeyId.hkClient:
        return '${value}23';
      case CycleKeyId.hkExternalSR:
        return '${value}33';
    }
  }
}

enum CycleKeyId {
  myClient,
  myExternalSR,
  phClient,
  phExternalSR,
  twClient,
  twExternalSR,
  thClient,
  thExternalSR,
  vnClient,
  vnExternalSR,
  sgClient,
  sgExternalSR,
  khClient,
  khExternalSR,
  mmClient,
  mmExternalSR,
  idClient,
  idExternalSR,
  krClient,
  krExternalSR,
  hkClient,
  hkExternalSR,
}
