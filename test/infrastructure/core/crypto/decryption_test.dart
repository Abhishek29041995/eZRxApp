import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/crypto/decryption.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final config = Config()..appFlavor = Flavor.mock;
  final mockOrderDecrypted = {
    'NewOrderInput': {
      'username': 'myrootadmin',
      'companyName': 'RSD HOSPITALS SDN BHD (SJMC) Test Name 2',
      'customer': {
        'customerNumber': '0030082707',
        'customerNumberShipTo': '0070149863',
        'salesOrganisation': '2001',
        'division': '',
      },
      'POReference': '',
      'materials': [
        {
          'materialNumber': '000000000021038305',
          'qty': 5,
          'bonuses': [],
          'Comment': '',
          'ParentID': '',
          'ProductType': 'MATERIAL',
          'price': 273.6,
          'tax': 0.0,
          'Mrp': 273.6,
          'PromoStatus': false,
          'PromoType': '',
          'PrincipalCode': '0000101246',
          'PrincipalName': 'BAXTER HEALTHCARE -M',
          'isCounterOffer': false,
        },
      ],
      'PODate': '2024-05-14',
      'RequestedDeliveryDate': '',
      'SpecialInstructions': '',
      'orderValue': 1368.0,
      'totalTax': 0.0,
      'Telephone': '0356341212035634',
      'referenceNotes': '',
      'paymentTerms': '',
      'CollectiveNumber': '',
      'blockOrder': false,
      'language': 'EN',
      'paymentMethod': 'Bank Transfer',
      'PurchaseOrderType': 'MRXS',
      'poDocuments': [],
    },
  };

  group(
    'Decryption',
    () {
      late Decryption decryption;

      setUp(() {
        decryption = Decryption();
      });

      test('Decryption Data', () async {
        const dataEncrypted =
            '53616c7465645f5fc43ab15f2f89a2de95b0584241d3a13c8f362f7a3f381aed';

        expect(decryption.decrypt(dataEncrypted), '0');
      });

      test(
        'Order decryption',
        () async {
          const dataEncrypted =
              '22b7adde7fd4b70dd49821ff9498fc412c2894849082ac768bb4ed0041b638d846627b4ffcfeae5690f70e93384fc2d5d276e1bcdcdada8f786856aa1cd65371c88956e0b45503c63b89613c2703355526fe173b470a5a432ebb8eaacd7bab0cb17674d4fe7b7ee8054a4350a939ebd02fa0eee92466f7cad9cce051c5ac6b25384c826045f011aabb3caccb4b6dc3932df2792a888fc35eed95dd26b595d3f23c7f48898a9d6856ad0b7c50703f50cbcbea70579c8c52afd2557fc9f65a7ca13bb3a0ea3609310e6d0bd69796f4ae6453a70455b76b90bd2efe15f7b94537a9ec86d6d1ab730b2f9a131bb577d6098995b5389fe683c229402cd81bd46f207e56b536ec0b2e233f74747efca16a10c45115914ea81181f198e08c90d96f0809af47f8251adc1dfdea709a66fefa2bc74782b98b09e753b809bd94ff9fa21f7527dc57cea206540b7ea4ca16058a5f8b545634d2ce0da44676fdfe25c6380c8420804031eafa769801eb686e0a15ccd75c7af61f6ec93b37fd7e6f052a2c0913a27ad31caa3a101d24b8440db1cd10c53f714e4ed501cb9dec6b0a1cff1b1dc41fca3d35bd9e73097d978a911cf219bf84bb9c827e33d803711be46440609e57b1d308171e41e868551fdcf2636cf4606002437340bc805cc548ca28edc328267d65d4ca60f78ce3c2ed9ded44172095ec7c8b051a0d132244ea796bdc87fa8202b98c2dcb4bd9f8f826ff2cb6c2c73efb03a685128e907fef6a4fbc819bdc5d99be7b4dd1e30f277fe3393e0b4a713186982d5e5ae89be3ec25b59f92586505bc2754beb64f7feb01c790ba90d3ce3a10a974d07088f8d2f6dc077cb5c473d9ed5d19d61263d59e711051ee70c79295e7287202e70d9861961d67e474a0e2e2fb82dc860e4c7f863215a9b6a09dbc10715cad3d08a51830b534e4b770d2e1fe4e0e772f1a0013c518c8118e7c9d42c8b7bcdd41e34ca55e51b3da2eabb58e111c7f5f7dd8c84dcea63209af6f169eb2b9d64cba13d181ed0327b160aa2bb6aef62c6bec12d4e18137dba59ebb7fbeec93fa22090771d508b40c5efea9f0cb0e322291f67cf2596b1ae3efa5de308dcd58483122e8fce589161f823b45c4f1a4abb508ae42b571cdc088c5ebb1b856751bd622351a1574f86b363ebbb40b1e1803ae3d83fdd5a37fc63381b95ad8d1b74f03be2cf13a68de90e0719fea9d718a';

          final data = decryption.orderDecrypt(
            encryptedText: dataEncrypted,
            secretKey: config.orderEncryptionSecret,
          );

          expect(
            jsonDecode(data),
            mockOrderDecrypted,
          );
        },
      );
    },
  );
}
