import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

void main() {
  late ProductImages productImage;
  late final ProductDetailRepository repository;
  late Map<MaterialNumber, ProductImages> fetchedMaterialImageMap;
  late ProductMetaData notFetchedMetaData;

  final fetchedMaterials = <MaterialInfo>[
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('3')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('4')),
  ];

  final notFetchedMaterials = <MaterialInfo>[
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('1')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('2')),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ProductDetailRepositoryMock();
    productImage = ProductImages.empty().copyWith(thumbNail: 'image_url_1');
    fetchedMaterialImageMap = {
      for (final materialInfo in fetchedMaterials)
        materialInfo.materialNumber:
            productImage.copyWith(materialNumber: materialInfo.materialNumber),
    };
    notFetchedMetaData = ProductMetaData.empty().copyWith(
      productImages: notFetchedMaterials
          .map((e) => productImage.copyWith(materialNumber: e.materialNumber))
          .toList(),
    );
  });

  group('Image Product Bloc', () {
    blocTest(
      'Initialize',
      build: () => ProductImageBloc(repository: repository),
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.initialized(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ],
    );

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch Product Image when all materials already present on state',
      build: () => ProductImageBloc(repository: repository),
      seed: () => ProductImageState.initial().copyWith(
        productImageMap: fetchedMaterialImageMap,
      ),
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(list: fetchedMaterials),
      ),
      expect: () {
        return [
          ProductImageState.initial().copyWith(
            isFetching: true,
            productImageMap: fetchedMaterialImageMap,
          ),
          ProductImageState.initial().copyWith(
            isFetching: false,
            productImageMap: fetchedMaterialImageMap,
          ),
        ];
      },
    );

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch material image success',
      build: () => ProductImageBloc(repository: repository),
      seed: () => ProductImageState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      setUp: () {
        when(
          () => repository.getProductsMetaData(
            materialNumbers:
                notFetchedMaterials.map((e) => e.materialNumber).toList(),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (_) async => Right(notFetchedMetaData),
        );
      },
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(list: notFetchedMaterials),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          isFetching: true,
        ),
        ProductImageState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
          isFetching: false,
          productImageMap: notFetchedMetaData.imageMap,
        ),
      ],
    );

    blocTest<ProductImageBloc, ProductImageState>(
      'Fetch material image failure',
      seed: () => ProductImageState.initial().copyWith(
        productImageMap: fetchedMaterialImageMap,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      build: () => ProductImageBloc(repository: repository),
      setUp: () {
        when(
          () => repository.getProductsMetaData(
            materialNumbers:
                notFetchedMaterials.map((e) => e.materialNumber).toList(),
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (ProductImageBloc bloc) => bloc.add(
        ProductImageEvent.fetch(list: notFetchedMaterials),
      ),
      expect: () => [
        ProductImageState.initial().copyWith(
          isFetching: true,
          productImageMap: fetchedMaterialImageMap,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        ProductImageState.initial().copyWith(
          isFetching: false,
          productImageMap: fetchedMaterialImageMap,
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ],
    );
  });
}
