import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:mocktail/mocktail.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

final mockStockInfo = StockInfo.empty().copyWith(
  materialNumber: MaterialNumber('8949542'),
  inStock: MaterialInStock('Yes'),
  expiryDate: DateTimeStringValue('NA'),
  salesDistrict: '',
  batch: StringValue(''),
);
final mockMaterialList = [
  PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('台灣拜耳股份有限公司'),
      ),
      remarks: '',
    ),
    stockInfo: mockStockInfo,
  ),
  PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168452'),
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('台灣拜耳股份有限公司'),
      ),
      remarks: '',
    ),
    stockInfo: mockStockInfo,
  ),
];

final mockStockInfoMapEmpty = <MaterialNumber, StockInfo>{};
final mockStockInfoMap = <MaterialNumber, StockInfo>{
  MaterialNumber('8949542'): mockStockInfo,
};

const remarkText = '1234';

final mockItemWithRemarks = PriceAggregate.empty().copyWith(
  quantity: 1,
  materialInfo: MaterialInfo.empty().copyWith(
    materialNumber: MaterialNumber('000000000023168451'),
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName: PrincipalName('台灣拜耳股份有限公司'),
    ),
    remarks: remarkText,
  ),
);

final priceTierItem1 = PriceTierItem.empty().copyWith(
  type: '',
  applyBonus: false,
  sequence: 1,
  quantity: 1,
  rate: 800,
);
final priceTierItem2 = PriceTierItem.empty().copyWith(
  type: '',
  applyBonus: false,
  sequence: 1,
  quantity: 3,
  rate: 850,
);
final priceTierItem3 = PriceTierItem.empty().copyWith(
  type: '',
  applyBonus: false,
  sequence: 1,
  quantity: 5,
  rate: 900,
);

final priceTierItem4 = PriceTierItem.empty().copyWith(
  type: '',
  applyBonus: false,
  sequence: 1,
  quantity: 1,
  rate: 900,
);
final priceTierItem5 = PriceTierItem.empty().copyWith(
  type: '',
  applyBonus: false,
  sequence: 1,
  quantity: 3,
  rate: 950,
);
final priceTierItem6 = PriceTierItem.empty().copyWith(
  type: '',
  applyBonus: false,
  sequence: 1,
  quantity: 5,
  rate: 1000,
);

final mockZmgCartItemList = <PriceAggregate>[
  PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168459'),
      materialDescription: ' Triglyceride Mosys D',
      materialGroup2: MaterialGroup('004'),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('台灣拜耳股份有限公司'),
      ),
    ),
    price: Price.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168459'),
      zmgDiscount: true,
      tiers: [
        priceTierItem1,
        priceTierItem2,
        priceTierItem3,
      ],
    ),
  ),
  PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168460'),
      materialDescription: ' Triglyceride Mosys D',
      materialGroup2: MaterialGroup('004'),
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName('台灣拜耳股份有限公司'),
      ),
    ),
    price: Price.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168460'),
      zmgDiscount: true,
      tiers: [
        priceTierItem4,
        priceTierItem5,
        priceTierItem6,
      ],
    ),
  ),
];

///TODO: Need to revisit

// final mockMaterialCartItemList = [
//   CartItem(materials: mockMaterialList, itemType: CartItemType.material),
//   //CartItem(materials: mockCartItemList, itemType: CartItemType.material)
// ];
// final mockMaterialCartItemFirst = mockMaterialCartItemList.first;
// final mockCartBundleList = [
//   CartItem(materials: mockMaterialList, itemType: CartItemType.bundle),
// ];
// final mockZmgMaterialCartItemList = [
//   CartItem(materials: mockZmgCartItemList, itemType: CartItemType.material),
// ];
// final mockZmgMaterialCartItemFirst = mockZmgMaterialCartItemList.first;
// final mockCartItem = CartItem(
//   materials: [PriceAggregate.empty()],
//   itemType: CartItemType.material,
// );
// final mockCartItemWithRemarks =
//     CartItem(materials: [mockItemWithRemarks], itemType: CartItemType.material);
// final mockCartItemWithOutBatch =
//     CartItem(materials: mockItemWithOutBatch, itemType: CartItemType.material);
// final mockCartItemWithBatch =
//     CartItem(materials: mockItemWithBatch, itemType: CartItemType.material);

//****************************************************************************************************** */
//                                                                                                       //
//                                  Bonus CartBloc variables                                             //
//                                                                                                       //
//                                                                                                       //
//********************************************************************************************************/

final bonusMaterialNumber = MaterialNumber('000000000023063913');

final bonus913MockCartItem = PriceAggregate.empty().copyWith(
  quantity: 1,
  materialInfo: MaterialInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName: PrincipalName('台灣拜耳股份有限公司'),
    ),
    remarks: '',
  ),
  stockInfo: StockInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    inStock: MaterialInStock('Yes'),
    expiryDate: DateTimeStringValue('NA'),
    salesDistrict: '',
    batch: StringValue(''),
  ),
  price: Price.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    finalPrice: MaterialPrice(540),
    bonuses: [
      PriceBonus(
        items: [
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('913'),
            qualifyingQuantity: 3,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 1,
                bonusRatio: 1,
                qualifyingQuantity: 3,
                calculation: BonusMaterialCalculation('913'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('913'),
            qualifyingQuantity: 5,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 2,
                bonusRatio: 2,
                qualifyingQuantity: 5,
                calculation: BonusMaterialCalculation('913'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('913'),
            qualifyingQuantity: 10,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 3,
                bonusRatio: 3,
                qualifyingQuantity: 10,
                calculation: BonusMaterialCalculation('913'),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

///TODO: Need to revisit

// final bonus913mockMaterialList = [
//   CartItem(materials: [bonus913MockCartItem], itemType: CartItemType.material)
// ];

final bonus911MockCartItem = PriceAggregate.empty().copyWith(
  quantity: 1,
  materialInfo: MaterialInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName: PrincipalName('台灣拜耳股份有限公司'),
    ),
    remarks: '',
  ),
  stockInfo: StockInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    inStock: MaterialInStock('Yes'),
    expiryDate: DateTimeStringValue('NA'),
    salesDistrict: '',
    batch: StringValue(''),
  ),
  price: Price.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    finalPrice: MaterialPrice(540),
    bonuses: [
      PriceBonus(
        items: [
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('911'),
            qualifyingQuantity: 3,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 1,
                bonusRatio: 1,
                qualifyingQuantity: 3,
                calculation: BonusMaterialCalculation('911'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('911'),
            qualifyingQuantity: 5,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 2,
                bonusRatio: 2,
                qualifyingQuantity: 5,
                calculation: BonusMaterialCalculation('911'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('911'),
            qualifyingQuantity: 10,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 3,
                bonusRatio: 3,
                qualifyingQuantity: 10,
                calculation: BonusMaterialCalculation('911'),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

///TODO: Need to revisit

// final bonus911mockMaterialList = [
//   CartItem(materials: [bonus911MockCartItem], itemType: CartItemType.material)
// ];

final bonus914MockCartItem = PriceAggregate.empty().copyWith(
  quantity: 1,
  materialInfo: MaterialInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName: PrincipalName('台灣拜耳股份有限公司'),
    ),
    remarks: '',
  ),
  stockInfo: StockInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    inStock: MaterialInStock('Yes'),
    expiryDate: DateTimeStringValue('NA'),
    salesDistrict: '',
    batch: StringValue(''),
  ),
  price: Price.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    finalPrice: MaterialPrice(540),
    bonuses: [
      PriceBonus(
        items: [
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('914'),
            qualifyingQuantity: 3,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 1,
                bonusRatio: 1,
                qualifyingQuantity: 3,
                calculation: BonusMaterialCalculation('914'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('914'),
            qualifyingQuantity: 5,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 2,
                bonusRatio: 1,
                qualifyingQuantity: 5,
                calculation: BonusMaterialCalculation('914'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('914'),
            qualifyingQuantity: 10,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 3,
                bonusRatio: 1,
                qualifyingQuantity: 10,
                calculation: BonusMaterialCalculation('914'),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

///TODO: Need to revisit

// final bonus914mockMaterialList = [
//   CartItem(materials: [bonus914MockCartItem], itemType: CartItemType.material)
// ];

final bonus915MockCartItem = PriceAggregate.empty().copyWith(
  quantity: 1,
  materialInfo: MaterialInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    materialDescription: ' Triglyceride Mosys D',
    principalData: PrincipalData.empty().copyWith(
      principalName: PrincipalName('台灣拜耳股份有限公司'),
    ),
    remarks: '',
  ),
  stockInfo: StockInfo.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    inStock: MaterialInStock('Yes'),
    expiryDate: DateTimeStringValue('NA'),
    salesDistrict: '',
    batch: StringValue(''),
  ),
  price: Price.empty().copyWith(
    materialNumber: bonusMaterialNumber,
    finalPrice: MaterialPrice(540),
    bonuses: [
      PriceBonus(
        items: [
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('915'),
            qualifyingQuantity: 3,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 1,
                bonusRatio: 1,
                qualifyingQuantity: 3,
                calculation: BonusMaterialCalculation('915'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('915'),
            qualifyingQuantity: 5,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 2,
                bonusRatio: 1,
                qualifyingQuantity: 5,
                calculation: BonusMaterialCalculation('915'),
              ),
            ],
          ),
          PriceBonusItem.empty().copyWith(
            calculation: BonusMaterialCalculation('915'),
            qualifyingQuantity: 10,
            bonusMaterials: [
              BonusMaterial.empty().copyWith(
                materialNumber: bonusMaterialNumber,
                materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                bonusQuantity: 3,
                bonusRatio: 1,
                qualifyingQuantity: 10,
                calculation: BonusMaterialCalculation('915'),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

///TODO: Need to revisit

// final cartItemListWithBonus = [
//   CartItem(
//     itemType: CartItemType.material,
//     materials: [
//       mockMaterialCartItemList.first.materials.first.copyWith(
//         price: Price.empty().copyWith(
//           materialNumber: bonusMaterialNumber,
//           finalPrice: MaterialPrice(540),
//           bonuses: [
//             PriceBonus(
//               items: [
//                 PriceBonusItem.empty().copyWith(
//                   calculation: BonusMaterialCalculation('913'),
//                   qualifyingQuantity: 3,
//                   bonusMaterials: [
//                     BonusMaterial.empty().copyWith(
//                       materialNumber: bonusMaterialNumber,
//                       materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
//                       bonusQuantity: 1,
//                       bonusRatio: 1,
//                       qualifyingQuantity: 3,
//                       calculation: BonusMaterialCalculation('913'),
//                     )
//                   ],
//                 ),
//                 PriceBonusItem.empty().copyWith(
//                   calculation: BonusMaterialCalculation('913'),
//                   qualifyingQuantity: 5,
//                   bonusMaterials: [
//                     BonusMaterial.empty().copyWith(
//                       materialNumber: bonusMaterialNumber,
//                       materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
//                       bonusQuantity: 2,
//                       bonusRatio: 2,
//                       qualifyingQuantity: 5,
//                       calculation: BonusMaterialCalculation('913'),
//                     )
//                   ],
//                 ),
//                 PriceBonusItem.empty().copyWith(
//                   calculation: BonusMaterialCalculation('913'),
//                   qualifyingQuantity: 10,
//                   bonusMaterials: [
//                     BonusMaterial.empty().copyWith(
//                       materialNumber: bonusMaterialNumber,
//                       materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
//                       bonusQuantity: 3,
//                       bonusRatio: 3,
//                       qualifyingQuantity: 10,
//                       calculation: BonusMaterialCalculation('913'),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       )
//     ],
//   )
// ];
// final bonus915mockMaterialList = [
//   CartItem(materials: [bonus915MockCartItem], itemType: CartItemType.material)
// ];

final batchStockInfoMock = [
  StockInfo.empty().copyWith(
    materialNumber: MaterialNumber('000000000023168451'),
    inStock: MaterialInStock('Yes'),
    expiryDate: DateTimeStringValue('NA'),
    salesDistrict: '',
    batch: StringValue('fake-batch'),
  ),
];

final mockItemWithOutBatch = [
  PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
    ),
  ),
];

final mockItemWithBatch = [
  PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
    ),
    stockInfo: batchStockInfoMock.first,
    stockInfoList: batchStockInfoMock,
  ),
];
