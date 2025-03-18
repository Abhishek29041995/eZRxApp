import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PriceOverrideRepositoryMock extends Mock
    implements PriceOverrideRepository {}

void main() {
  late PriceOverrideRepository priceOverrideRepositoryMock;
  late List<PriceAggregate> cartItems;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    cartItems = await CartLocalDataSource().upsertCart();
    priceOverrideRepositoryMock = PriceOverrideRepositoryMock();
  });

  group(
    'Testing price override bloc',
    () {
      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc Initial',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          PriceOverrideEvent.initialized(
            item: cartItems.first.copyWith(
              materialInfo: cartItems.first.materialInfo.copyWith(
                counterOfferDetails: RequestCounterOfferDetails.empty(),
              ),
            ),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            item: cartItems.first.copyWith(
              materialInfo: cartItems.first.materialInfo.copyWith(
                counterOfferDetails: RequestCounterOfferDetails.empty(),
              ),
            ),
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc onPriceValueChange',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty(),
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.onPriceValueChange(
            newPrice: '20',
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('20'),
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc onChangeDiscountValue',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty(),
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.onDiscountValueChanged(
            newValue: '50',
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  discountOverridePercentage: CounterOfferDiscountValue('50'),
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc Validate Input Fields showErrorMessage --> true',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
                counterOfferPrice: CounterOfferValue('0'),
                discountOverridePercentage: CounterOfferDiscountValue('100'),
              ),
            ),
          ),
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            showErrorMessages: true,
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('0'),
                  discountOverridePercentage: CounterOfferDiscountValue('100'),
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc Validate Input Fields showErrorMessage --> false',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
                counterOfferPrice: CounterOfferValue('100'),
                discountOverridePercentage: CounterOfferDiscountValue('10'),
              ),
            ),
          ),
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
        expect: () => [],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc onRemarksValueChange',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty(),
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.onRemarksValueChange(
            newRemarks: 'fake-test',
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  comment: StringValue('fake-test'),
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Fetch the overrided price',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        setUp: () {
          when(
            () => priceOverrideRepositoryMock.updateItemPrice(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  counterOfferDetails:
                      RequestCounterOfferDetails.empty().copyWith(
                    counterOfferPrice: CounterOfferValue('100'),
                    discountOverridePercentage: CounterOfferDiscountValue('10'),
                    comment: StringValue('fake-comment'),
                  ),
                ),
              ),
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              Price.empty().copyWith(
                finalPrice: MaterialPrice(90),
                lastPrice: MaterialPrice(250),
              ),
            ),
          );
        },
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
                counterOfferPrice: CounterOfferValue('100'),
                discountOverridePercentage: CounterOfferDiscountValue('10'),
                comment: StringValue('fake-comment'),
              ),
            ),
          ),
        ),
        act: (bloc) => bloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('100'),
                  discountOverridePercentage: CounterOfferDiscountValue('10'),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
            isFetching: true,
          ),
          PriceOverrideState.initial().copyWith(
            isFetching: false,
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('100'),
                  discountOverridePercentage: CounterOfferDiscountValue('10'),
                  comment: StringValue('fake-comment'),
                ),
              ),
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(90),
                lastPrice: MaterialPrice(250),
                isPriceOverride: true,
                isDiscountOverride: true,
                priceOverride: PriceOverrideValue(100),
                zdp8Override: Zdp8OverrideValue(10),
              ),
            ),
            apiFailureOrSuccessOption: optionOf(
              Right(
                Price.empty().copyWith(
                  finalPrice: MaterialPrice(90),
                  lastPrice: MaterialPrice(250),
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'failed to Fetch the overrided price',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        setUp: () {
          when(
            () => priceOverrideRepositoryMock.updateItemPrice(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  counterOfferDetails:
                      RequestCounterOfferDetails.empty().copyWith(
                    counterOfferPrice: CounterOfferValue('70'),
                    comment: StringValue('fake-comment'),
                  ),
                ),
              ),
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.priceOverrideNotFound(),
            ),
          );
        },
        seed: () => PriceOverrideState.initial().copyWith(
          item: PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
                counterOfferPrice: CounterOfferValue('70'),
                comment: StringValue('fake-comment'),
              ),
            ),
          ),
        ),
        act: (bloc) => bloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('70'),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
            isFetching: true,
          ),
          PriceOverrideState.initial().copyWith(
            showErrorMessages: true,
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.priceOverrideNotFound()),
            ),
            isFetching: false,
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('70'),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
          ),
        ],
      );

      test(
        'Check IsPriceOverrideValue and IsDiscountOverrideValue Valid ',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('100'),
                  discountOverridePercentage: CounterOfferDiscountValue('10'),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
          );
          final isPriceOverrideValid = priceOverrideState.isPriceOverride;
          final isDiscountOverrideValid = priceOverrideState.isDiscountOverride;
          expect(isPriceOverrideValid, true);
          expect(isDiscountOverrideValid, true);
        },
      );

      test(
        'Check IsPriceOverrideValue and IsDiscountOverrideValue NotValid ',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue(''),
                  discountOverridePercentage: CounterOfferDiscountValue(''),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
          );
          final isPriceOverrideValid = priceOverrideState.isPriceOverride;
          final isDiscountOverrideValid = priceOverrideState.isDiscountOverride;
          expect(isPriceOverrideValid, false);
          expect(isDiscountOverrideValid, false);
        },
      );

      test(
        'Check isInputFieldValid ',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('100'),
                  discountOverridePercentage: CounterOfferDiscountValue('10'),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
          );
          final isInputFieldValid = priceOverrideState.isInputFieldValid;
          expect(isInputFieldValid, true);
        },
      );

      test(
        'Check Not isInputFieldValid ',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue(''),
                  discountOverridePercentage: CounterOfferDiscountValue(''),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
          );
          final isInputFieldValid = priceOverrideState.isInputFieldValid;
          expect(isInputFieldValid, false);
        },
      );

      test(
        'Check newDiscountPrice ',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                counterOfferDetails:
                    RequestCounterOfferDetails.empty().copyWith(
                  counterOfferPrice: CounterOfferValue('100'),
                  discountOverridePercentage: CounterOfferDiscountValue('10'),
                  comment: StringValue('fake-comment'),
                ),
              ),
            ),
          );
          final newDiscountPrice = priceOverrideState.overridedPrice;
          expect(
            newDiscountPrice,
            90,
          );
        },
      );

      test(
        'Check DiscountPrice with priceValueForPriceOverride',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(90),
                isDiscountOverride: true,
              ),
            ),
          );
          final newDiscountPrice = priceOverrideState.overridedPrice;
          expect(
            newDiscountPrice,
            90,
          );
        },
      );

      test(
        'Check finalCounterOfferPrice not hide price and not has counter offer',
        () {
          final priceOverrideState = PriceOverrideState.initial().copyWith(
            item: PriceAggregate.empty().copyWith(
              price: Price.empty().copyWith(
                finalPrice: MaterialPrice(90),
                isDiscountOverride: true,
              ),
              materialInfo: MaterialInfo.empty().copyWith(hidePrice: false),
            ),
          );
          final finalCounterOfferPrice =
              priceOverrideState.finalCounterOfferPrice;
          expect(
            finalCounterOfferPrice,
            'Not requested'.tr(),
          );
        },
      );
    },
  );
}
