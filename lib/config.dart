import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';

enum Flavor { mock, dev, uat, prod }

class Config {
  Flavor appFlavor = Flavor.prod;
  int httpSendTimeout = 150000;
  int httpConnectTimeout = 150000;
  int httpReceiveTimeout = 150000;
  int httpIdleTimeout = 15000;
  Duration dateRangePickerDuration = const Duration(days: 1095);
  int pageSize = 10;
  int productTabPageSize = 24;
  bool bypassNotificationPermission = false;

  // For article and announcement lists, due to technical bottlenecks on the Sitecore side, the backend is unable to provide search and filter support.
  // Therefore, we need to address this issue locally, we handle filter data from our side
  // There are some cases where we get the filtered items too small and cannot trigger the load more function in the listView
  // So we increased the page to 1000 to ensure there are enough items after filtering on 1 page to trigger load more function

  int articlePageSize = 1000;
  int autoSearchTimeout = 1500;
  int maximumCartQuantity = 99999;
  int maximumUploadSize = 20;
  String customScheme = 'ezrx://';
  String channelName = 'eZRx notification';

  DateTime newReturnRequestFilterStartDate = DateTime(
    DateTime.now().year - 5,
    DateTime.now().month,
    DateTime.now().day,
  );

  String get domain {
    switch (appFlavor) {
      case Flavor.prod:
      case Flavor.uat:
        return '.ezrxplus.com';
      case Flavor.dev:
      default:
        return '.ezrx.com';
    }
  }

  String baseUrl({String? marketDomain}) {
    switch (appFlavor) {
      // https://my.ezrxplus.com/
      case Flavor.prod:
        return '$schema$marketDomain$domain';
      // https://ezrxplus-dev.ezrx.com/
      case Flavor.dev:
        return '${schema}ezrxplus-$env$domain';
      // https://uat-my.ezrxplus.com/
      case Flavor.mock:
      case Flavor.uat:
        return '$schema$env-$marketDomain$domain';
    }
  }

  String get env {
    switch (appFlavor) {
      case Flavor.mock:
        return 'mock';
      case Flavor.dev:
        return 'dev';
      case Flavor.uat:
        return 'uat';
      case Flavor.prod:
        return 'prod';
      default:
        return '';
    }
  }

  String get schema {
    switch (appFlavor) {
      case Flavor.mock:
        return 'http://';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return 'https://';
    }
  }

  String get urlConstants {
    switch (appFlavor) {
      case Flavor.uat: // return '/ezrxapi/api/';
      case Flavor.dev:
      case Flavor.prod:
        return '/api/';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String get appName {
    switch (appFlavor) {
      case Flavor.mock:
        return 'eZRx+ Mock';
      case Flavor.dev:
        return 'eZRx+ Dev';
      case Flavor.uat:
        return 'eZRx+ Uat';
      case Flavor.prod:
      default:
        return 'eZRx+';
    }
  }

  String get packageName {
    switch (appFlavor) {
      case Flavor.mock:
        return 'com.zuelligpharma.ezrxplus.mock';
      case Flavor.dev:
        return 'com.zuelligpharma.ezrxplus.dev';
      case Flavor.uat:
        return 'com.zuelligpharma.ezrxplus.uat';
      case Flavor.prod:
      default:
        return 'com.zuelligpharma.ezrxplus';
    }
  }

  String get orderEncryptionSecret {
    switch (appFlavor) {
      case Flavor.mock:
      case Flavor.dev:
      case Flavor.uat:
        return 'abcdefghijklmnopqrstuvwxyz012345';
      case Flavor.prod:
        return 'HRppzSHG1WAlyvcKx8lFC0TEeT5OcBBr';
    }
  }

  //============================================================
  //  Okta SSO login
  //
  //============================================================

  Map<String, dynamic> get oktaConfig {
    switch (appFlavor) {
      case Flavor.mock:
      case Flavor.dev:
      case Flavor.uat:
        return {
          'client_id': '0oabg64fqts2fjher697',
          'redirect_uri': 'com.okta.zuellig-ciam:/callback',
          'end_session_redirect_uri': 'com.okta.zuellig-ciam:/',
          'discovery_uri': 'https://zuellig-ciam.okta.com/',
          'scopes': ['openid', 'profile', 'offline_access'],
        };
      case Flavor.prod:
      default:
        return {
          'client_id': '0oabg4njjrTWhg1jD697',
          'redirect_uri': 'com.okta.zuellig-ciam:/callback',
          'end_session_redirect_uri': 'com.okta.zuellig-ciam:/',
          'discovery_uri': 'https://zuellig-ciam.okta.com/',
          'scopes': ['openid', 'profile', 'offline_access'],
        };
    }
  }
  //============================================================
  //  Create Account Url
  //============================================================

  String get createAccountUrl =>
      'http://zpregistration.zuelligpharma.com/Registration/Index';

  //============================================================
  //  Firebase
  //
  //============================================================

  FirebaseOptions get firebaseOptions {
    switch (appFlavor) {
      case Flavor.mock:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:ffb59bbd88016e7cf6589b',
          measurementId: 'G-HGBQM0L9J3',
        );
      case Flavor.dev:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:b18e5cc1431e6e3df6589b',
          measurementId: 'G-Z61EE1QCHC',
        );
      case Flavor.uat:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:7c4467b519575509f6589b',
          measurementId: 'G-9DQSS4RCFZ',
        );
      case Flavor.prod:
      default:
        return const FirebaseOptions(
          apiKey: 'AIzaSyDHfqmNqiFyVZ0u4QLREXabDqyrRQP12OY',
          authDomain: 'ezrx-6494b.firebaseapp.com',
          databaseURL: 'https://ezrx-6494b.firebaseio.com',
          projectId: 'ezrx-6494b',
          storageBucket: 'ezrx-6494b.appspot.com',
          messagingSenderId: '1064533093414',
          appId: '1:1064533093414:web:de2a644d4926f664800ae7',
          measurementId: 'G-V6D452L2G1',
        );
    }
  }

  //============================================================
  //  Mixpanel
  //
  //============================================================

  String get mixpanelKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'd54077d895c2f2ab9b78f6a70d5f0e6f';
      case Flavor.uat:
        return '3d6a7eee1377f95ad8b24f204b112f24';
      case Flavor.prod:
      default:
        return '8b725579df59111dd76fc65f2be558f0';
    }
  }

  //============================================================
  //  datadog
  //
  //============================================================

  DatadogSite get datadogSite => DatadogSite.eu1;
  String get datadogServiceName => 'ezrx_plus_mobile';

  bool get enableDatadog => appFlavor == Flavor.prod;

  String get datadogClientToken {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'puba4e364a64aa781d35dbf6ddf6cbfa1b5';
      case Flavor.uat:
        return 'pub38abef4a2d6566119146870309832030';
      case Flavor.prod:
      default:
        return 'pub269a36622765ad671c91467128e95b09';
    }
  }

  String get datadogRumConfiguration {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'efd0c397-46af-49b9-a26e-cb66705653a1';
      case Flavor.uat:
        return '61fde84c-a586-4348-a74d-5081128ee0d7';
      case Flavor.prod:
      default:
        return 'aa26321c-b2b9-4eac-91c8-5a8dfd52222c';
    }
  }

  //============================================================
  //  Scandit
  //
  //============================================================

  String get scanditLicenseKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'AQNDXCWEA91tO11u/DwIZ1AecF3/DP7i0FoDVo1vhNp7S4LFyViOfv1mJafoQCWnpwwV6yRPA10jTDtf2D8g3cVW+dgYIp+T3hX482AqybOWVOn3f1E81nhMHKZ4VowcJWZ49HFr3bukJ+SbnzPfQtEpgQpeEq6G2SabrzaowhzUXA4jcC/PjKF7KuDjEQCDhsy2Wsq0rlkgN8ilJhX87B9uQcSAjyhoqKvWJgLwCp04zmOLmcZ1BJ8eHvo2fDvZP8a8u0ZrDX22H509iw2QOv3R4HZ5wc2Hxe+MqjnYabpKND+z9BK3giFnjJ2IykoznclVc0FVoviuw++8icN2fUyBd+J46oHlZoer6UBWcvvbWVzFWBaS9kJsd1sypSHQl6Htx19UioEyLGwiWD4oj/XtGnGWSBkmfweazrmD84JUA1T07HYn5vWl5ulfE7u0KndE0emSVgon+lyd7OYTzwbuLKQbPLsx41qAeaabbroR41L071yWtD6jY2d6u2Hasi1b/R9oR8FAEs9bNDZoyA9s9kJoP0P1Uq9MFRwfo6+PdCIv1bqFuUcEaxhoD0NVnDWLiUFWX5ORz0qJ2xUGeou0v9hhR0fzCRvn6Pb3GhgDRiaAMZmqmvhXkM9ca3wb4vOzBh3eJEh/ZJCQUVJzo/KQIvsndsLOGOdPHg4OyUjemwR6urRT3/GUW+M+Qu/biiWDxUdulmKONvLcgH0pBhCnTDweYC6Pez+O415Adn+Ptd5qPiIzBYqO95wdUfj1/eTg0DJUKjj3XfVlU77jjAbGvc7NNhhUfWKqsNgmMAnRFG4nWmWiedIQsUjLZhrReT3SPK23IQ==';
      case Flavor.prod:
        return 'AUljloOBFzcDBTOWSA48v0ApoDD8R/0MIk5BUTNd+vwuSxe27kFZCshzoLTkXsfJ+kyQCMxSbF7cILg+QXF/25VISBS9RMqU3StrUvQojXbcemPms2VQYjlAHYhsYSgOtW0GYtshu2fsGlynfhw9kfctkST+cz1U7Vdj7iADHwflfOQ3SIYP4LWxFYzAwFQkUjeky0kuE3ay/XYcNYceXc9+XG4FkkB+5K/fLX2xtBmUtGm0jM8corE7ukz3cYdlIAK9eeKiLyeVw8QY3RgG3VdQZtIOGyA2qVEMvMRrXYUdXZKLE1bMNmvCyopU/WFVQuZzoay8gsgZ8OhZDHfoP6O84uH5kPMu4AnsoBdAuHfDcA2pwQoLHfXJiEm2WdEtO3Zq3E+fZwLnhRXs3U68tC+N+Ts34CYm3yQhKKiU2vWkuMBjPq+oRZb92hOhLTVCDAYeQuW2TyMDv3ch1vaelKCMRZyc2Q3KL80ye/+fQX788kXw9oFOhaBvVRqzOq5791jpgcXNtgYHseEdwTPmKv3HSgEYpt+zV2EpEaKoshcTtGi9itUwhxGIcaN63/g85lMau5A7NpqFJWLJQx8izfEQuV2k7emKZKmosqdiur/dlLB6nII8X9Z1H+GKr8BgV2P6ixh/pJ8iiqKVu3KhZ9F67TnVWodxT4owkNkYGCXmHb7DcqKXeoil3vlSAibHbCb0KWScMzY0E/8xEVttXar8lPApVJF9/AKThxaoVd32lRZt53SJlKarJjtwUzpQxHCDpGkYtg8soBw/q2oJwy6SWiDrKQ0zJFyfSG/fPAoX34Ehg6SFMXLuERHxm7y1caw=';
      case Flavor.uat:
      default:
        return 'AT7ziDKEFOKEA8TR1z0TLJ057dQ1HURMAnlRe91MVMEhTXgR21e8By9ql5iNWUwGaA1QNytaGRzSS4yeQWrunC5NqWmEWWPyUzO1bcpHM++3duiflUmG8MggbAoFXzHPiHwluU5HtvgKOLpjSURpSmQYNBJwFLDEK89/ibjyUG+T6aX1WO6ke2zaOXSytqUa53Tn8JXxDo1hql71X3h2N7SJ3q8AuYkXhR6Iv7seuaIMjD94oiyNbwSGiwsjyf7ryn0HpYa1Y1zTUvez7Clx8iOIOoivFycepVMOk8MtsR3gTrpjAc7p5PyoGw9aCXLMwgIlfygPy03P0j+UHkoy5utLUWUQAI4bGxh7UhpTOOLna+WuT7gKFfjmNOFFcF2yw+h9Eb8/DXOE2dAqN6Q/JcEE5F+5zXmYLETg2B8ZONnlDThdJfiqM6uumNPYRmKlegztmp8lchlAvSbMRTaQ0lamsBrz3o6XSc2SxTqO+htlZC5nqR/ZsQ0+FYLnbwAi3pTI9w8BysU2Ww2Fvy4ft0c3GPth7popJBHW3ZLHWEckZ9UODr4vW6T8QNfmMq4gd2vAwpcSrdSp92xPyiVPwZBM9fXEkXwu+2KIgdzif1AODIA+WVSPEDVTwMAIBugOdPbnMMQxWFV/V+5RZQkQvX8oyZyA52qv4RdBGAniq6POFcGwM1M0mGCWN1fW9F7IIfK9DYlF2tCKptUtgZJJD/fhlefTdx0flt8mYDXHGDodnNl+PjGtbsjRflaK8X9OjqSJemm3QihjJGv3LG35jStN7p6RSgDrXEBxyWSqKVfrbGe9fmLhWRSsfq9rGDu+ncYAqAOTuw==';
    }
  }

  List<Symbology> get enabledSymbologies => [
        Symbology.code128,
        Symbology.ean13Upca,
        Symbology.ean8,
        Symbology.qr,
        Symbology.upce,
        Symbology.code39,
      ];

  List<String> get allowedExtensions => [
        'jpg',
        'pdf',
        'png',
      ];

  List<String> get allowedExtensionsEzcsTicket => [
        'jpg',
        'pdf',
        'png',
        'jpeg',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'zip',
      ];

  //============================================================
  //  Payment advice logo
  //
  //============================================================

  List<String> get allowedExtensionsPaymentAdviceLogo => [
        'png',
        'jpg',
        'jpeg',
      ];

  //============================================================
  //  eZReach
  //
  //============================================================
  // https://zuelligpharma.atlassian.net/wiki/spaces/CONSUB/pages/78283852/eZReach+integration+with+eZRx
  String get targetProduct => 'EZRX+';

  String get getEZReachUrlConstant => '/api/campaign';

  String get eZReachToken {
    switch (appFlavor) {
      case Flavor.mock:
        return '';
      case Flavor.dev:
      case Flavor.uat:
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJc0FjdGl2ZSI6dHJ1ZSwiVXNlck5hbWUiOiJJbnRlZ3JhdGlvbiBVc2VyIiwiZW1haWwiOiJpbnRlZ3JhdGlvblVzZXJAZXpyeC5jb20iLCJleHAiOjE3NjQ2NDY3NDEsImlhdCI6MTY2OTk3Mzk0MSwicHJvdmlkZXIiOiJUZXN0IEFkbWluIiwicm9sZSI6ImN1c3RvbWVyIiwidXNlcklkIjoiNjM4NWE4NTc3MGQ5ZjFkZDU1MmFkZmFiIn0.xSjadOGP0XiC-9t2CoS0Yy6MEIbhIozi08i4vS0VQsA';
      case Flavor.prod:
      default:
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyTmFtZSI6IkVaUlgrIEludGVncmF0aW9uIFVzZXIiLCJleHAiOjE3ODE4MjU1NzIsImlhdCI6MTY4NzE1Mjc3Miwicm9sZSI6ImludGVncmF0aW9uX3VzZXIifQ.RDFaeTwfg8_UDoqw-krccnConYxJc1NS-LA0y7QFXx0';
    }
  }

  //============================================================
  //  ChatBot
  //
  //============================================================

  String get getBotId {
    switch (appFlavor) {
      case Flavor.dev:
        return 'x1679377148926';
      case Flavor.uat:
        return 'x1679377149397';
      case Flavor.prod:
        return 'x1679377150018';
      default:
        return '-';
    }
  }

  String get getBotCustomURL => 'https://r3.cloud.yellow.ai';

  //============================================================
  //  Announcement Info
  //
  //============================================================

  String get getAnnouncementApiKey {
    switch (appFlavor) {
      case Flavor.dev:
        return 'TDFxR1Z0VlhIcjE5LzRHNHJ0MG9jNWMyUmhvUmdDdldjMS9LbzZoNnJYQT18enVlbGxpZ3BoYXI5YjM0LXpwY21zLXRlc3QtZmNmOQ==';
      case Flavor.uat:
        return 'YjdLWWNucEk1akpGNDBWdFU3VUFuaUx3Sk9MVExVMlRsUXo1Y1Y2bXpwQT18enVlbGxpZ3BoYXI0MDBmLXpwY21zLXVhdC1jZTBm';
      case Flavor.prod:
        return 'OGtnRUErUi9uZGl0cE9LV213L0tHZXh3Vjl5cjcwa1VNTGpWNk9acGprbz18enVlbGxpZ3BoYXIzYzkwLXpwY21zLXByb2QtNDUzMg==';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String get announcementApiUrlPath => '/api/announcement';

  String get announcementTemplate => 'EA1748E3-EF3B-4D38-B2C9-937B90864DED';

  String get announcementVnTemplate => '{E95336DD-CB51-4663-BCB3-422246B12D45}';

  String get articleTemplate => 'DA48D344-04CE-411B-B721-5D1B4F807860';
  String get announcementArticleTagTemplate =>
      'F507E453-59E6-4204-8547-379EF37256CA';
  String get idMarketArticleTemplate1 => '54EA13A9-6EDE-46ED-B5CB-7A4B14D99D69';
  String get idMarketArticleTemplate2 => 'DD1070C3-A45A-4412-B2CD-7892567B136E';
  String get faqTemplate => '4A583EF3-A105-4A00-BC98-EC96A9967966';

  String get announcementImageBaseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://edge.sitecorecloud.io/zuelligphar9b34-zpcms-test-fcf9/';
      case Flavor.uat:
        return 'https://edge.sitecorecloud.io/zuelligphar400f-zpcms-uat-ce0f/';
      case Flavor.prod:
        return 'https://edge.sitecorecloud.io/zuelligphar3c90-zpcms-prod-4532/';
      case Flavor.mock:
      default:
        return '';
    }
  }

  // String get announcementImageBaseUrl =>
  //     'https://edge.sitecorecloud.io/zuelligphar400f-zpcms-uat-ce0f/';

  //============================================================
  //  EZPoint
  //============================================================

  String get getEZPointIframe {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
        return 'https://apq-fe.ezrx.id/voucher-regional';
      case Flavor.prod:
        return 'https://ezrx.id/voucher-regional';
      case Flavor.mock:
      default:
        return '';
    }
  }

  //============================================================
  //  Contact us
  //
  //============================================================

  String get xGQLToken {
    switch (appFlavor) {
      case Flavor.prod:
        return 'OGtnRUErUi9uZGl0cE9LV213L0tHZXh3Vjl5cjcwa1VNTGpWNk9acGprbz18enVlbGxpZ3BoYXIzYzkwLXpwY21zLXByb2QtNDUzMg==';
      case Flavor.mock:
      case Flavor.uat:
        return 'YjdLWWNucEk1akpGNDBWdFU3VUFuaUx3Sk9MVExVMlRsUXo1Y1Y2bXpwQT18enVlbGxpZ3BoYXI0MDBmLXpwY21zLXVhdC1jZTBm';
      case Flavor.dev:
        return 'TDFxR1Z0VlhIcjE5LzRHNHJ0MG9jNWMyUmhvUmdDdldjMS9LbzZoNnJYQT18enVlbGxpZ3BoYXI5YjM0LXpwY21zLXRlc3QtZmNmOQ==';
    }
  }

  String get getCleverTapId {
    switch (appFlavor) {
      case Flavor.prod:
        return '698-WW8-476Z';
      case Flavor.mock:
      case Flavor.uat:
        return 'TEST-798-WW8-476Z';
      case Flavor.dev:
        return 'TEST-464-R68-876Z';
    }
  }

  String getUserGuidePdfUrl(String marketDomain) =>
      '${baseUrl(marketDomain: marketDomain)}${'/static/mobileUserGuide.pdf'}';

  String getContactUsStaticEmail(String country) {
    final contactUsEmailMapProd = {
      'MY': 'myezrx@zuelligpharma.com',
      'KR': 'support@ezrxplus.com',
      'ID': 'feedback@zuelligpharma.com',
      'KH': 'support@ezrxplus.com',
      'MM': 'support@ezrxplus.com',
      'PH': 'support@ezrxplus.com',
      'SG': 'support@ezrxplus.com',
      'TW': 'ezrx4u@zuelligpharma.com',
      'TH': 'support@ezrxplus.com',
      'VN': 'support@ezrxplus.com',
    };

    final contactUsEmailMapUat = {
      'MY': 'support@ezrxplus.com',
      'ID': 'feedback@zuelligpharma.com',
      'KH': 'support@ezrxplus.com',
      'MM': 'support@ezrxplus.com',
      'PH': 'support@ezrxplus.com',
      'SG': 'support@ezrxplus.com',
      'TW': 'support@ezrxplus.com',
      'TH': 'support@ezrxplus.com',
      'VN': 'support@ezrxplus.com',
    };

    final contactUsEmailMap =
        appFlavor == Flavor.prod ? contactUsEmailMapProd : contactUsEmailMapUat;

    return contactUsEmailMap[country] ?? 'support@ezrxplus.com';
  }

  String get ministryOfHealthPrincipalCode {
    switch (appFlavor) {
      case Flavor.prod:
        return '100822';
      case Flavor.uat:
      default:
        return '100777';
    }
  }

  List<AppMarket> get supportedMarkets {
    switch (appFlavor) {
      case Flavor.prod:
        return AppMarket.prodSupportedMarkets;
      default:
        return AppMarket.supportMarkets;
    }
  }
}
