import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bundleMock =
      (await MaterialBundleListLocalDatasource().getMaterialBundleList()).first;
  final bundleMaterialsMocks = await MaterialBundleListLocalDatasource()
      .getMaterialBundleListForSalesRep();
  final stateAfterSet = BundleAddToCartState.initial().copyWith(
    materialInfo: bundleMock.copyWith.bundle(materials: bundleMaterialsMocks),
  );
  const quantity = 10;
  final stateAfterUpdateQuantity = stateAfterSet.copyWith(
    materialInfo: bundleMock.copyWith.bundle(
      materials: bundleMaterialsMocks
          .map(
            (element) => element.materialNumber == bundleMock.materialNumber
                ? element.copyWith(quantity: MaterialQty(quantity))
                : element,
          )
          .toList(),
    ),
  );

  group('Bundle Add To Cart Bloc test', () {
    blocTest<BundleAddToCartBloc, BundleAddToCartState>(
      'Initialized',
      build: () => BundleAddToCartBloc(),
      act: (BundleAddToCartBloc bloc) =>
          bloc.add(const BundleAddToCartEvent.initialized()),
      expect: () => [BundleAddToCartState.initial()],
    );

    blocTest<BundleAddToCartBloc, BundleAddToCartState>(
      'Set the bundle and bundleMaterials',
      build: () => BundleAddToCartBloc(),
      act: (BundleAddToCartBloc bloc) => bloc.add(
        BundleAddToCartEvent.set(bundle: bundleMock),
      ),
      expect: () => [
        BundleAddToCartState.initial().copyWith(
          materialInfo: bundleMock,
        ),
      ],
    );

    blocTest(
      'Update the quantity',
      build: () => BundleAddToCartBloc(),
      seed: () => stateAfterSet,
      act: (BundleAddToCartBloc bloc) => bloc.add(
        BundleAddToCartEvent.updateQuantity(
          materialNumber: bundleMock.materialNumber,
          quantity: quantity,
        ),
      ),
      expect: () => [stateAfterUpdateQuantity],
    );

    blocTest(
      'Validate the quantity',
      build: () => BundleAddToCartBloc(),
      seed: () => stateAfterSet,
      act: (BundleAddToCartBloc bloc) => bloc.add(
        const BundleAddToCartEvent.validateQuantity(showErrorMessage: true),
      ),
      expect: () => [stateAfterSet.copyWith(showErrorMessage: true)],
    );
  });
  group('Bundle Add To Cart State test', () {
    test('Check bundleMaterialsSelected', () {
      expect(
        stateAfterUpdateQuantity.bundleMaterialsSelected,
        stateAfterUpdateQuantity.materialInfo.bundle.materials
            .where((element) => element.quantity.intValue > 0)
            .toList(),
      );
    });

    test('Check selectedMaterialInfo', () {
      expect(
        stateAfterUpdateQuantity.selectedMaterialInfo(
          PriceAggregate.empty().copyWith(
            bundle: Bundle.empty().copyWith(materials: bundleMaterialsMocks),
          ),
        ),
        [
          stateAfterUpdateQuantity.materialInfo.bundle.materials
              .where((element) => element.quantity.intValue > 0)
              .toList()
              .first
              .copyWith(quantity: MaterialQty(10)),
        ],
      );
    });
    test('Check selectedMaterialInfo orElse case', () {
      expect(
        stateAfterUpdateQuantity.selectedMaterialInfo(PriceAggregate.empty()),
        [
          stateAfterUpdateQuantity.materialInfo.bundle.materials
              .where((element) => element.quantity.intValue > 0)
              .toList()
              .first
              .copyWith(quantity: MaterialQty(10)),
        ],
      );
    });

    test('Check displayErrorMessage', () {
      expect(
        stateAfterSet.copyWith(showErrorMessage: true).displayErrorMessage,
        true,
      );

      expect(
        stateAfterUpdateQuantity.displayErrorMessage,
        false,
      );

      expect(
        stateAfterUpdateQuantity
            .copyWith(showErrorMessage: true)
            .displayErrorMessage,
        false,
      );
    });
  });
}
