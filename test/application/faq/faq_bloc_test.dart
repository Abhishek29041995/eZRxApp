import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/repository/faq_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/sales_organsiation_mock.dart';

class MockFAQInfoRepository extends Mock implements FAQInfoRepository {}

void main() {
  late FAQInfoRepository repository;
  late FAQInfo faqInfo;
  late Config config;
  final faqState = FaqState.initial();
  final salesOrg = fakeMYSalesOrg;

  setUpAll(() async {
    config = Config()..appFlavor = Flavor.mock;
    WidgetsFlutterBinding.ensureInitialized();
    repository = MockFAQInfoRepository();

    faqInfo = await FAQInfoLocalDataSource().getFAQInfo(salesOrg.country);
  });
  group('FAQ Bloc', () {
    blocTest(
      'Get Faq success',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            faqInfo,
          ),
        );
      },
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.getFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
          faqInfo: FAQInfo.empty(),
        ),
        faqState.copyWith(
          faqInfo: faqInfo,
          selectedCategory: FAQCategory('All'),
          apiFailureOrSuccessOption: optionOf(Right(faqInfo)),
        ),
      ],
      verify: (FaqBloc bloc) => expect(
        bloc.state.faqInfo,
        faqInfo,
      ),
    );
    blocTest(
      'Get Faq fail',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.getFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
        ),
        faqState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );
    blocTest<FaqBloc, FaqState>(
      'faq loadMore',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            faqInfo,
          ),
        );
      },
      act: (bloc) => bloc.add(
        FaqEvent.loadMoreAFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
        ),
        faqState.copyWith(
          apiFailureOrSuccessOption: optionOf(
            Right(
              faqInfo,
            ),
          ),
          faqInfo: faqInfo,
        ),
      ],
    );
    blocTest<FaqBloc, FaqState>(
      'faq loadMore fail',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      setUp: () {
        when(
          () => repository.getFAQList(
            salesOrg: salesOrg,
            pageSize: config.pageSize,
            after: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        FaqEvent.loadMoreAFaq(
          salesOrg: salesOrg,
        ),
      ),
      expect: () => [
        faqState.copyWith(
          isFetching: true,
        ),
        faqState.copyWith(
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('fake-error'))),
        ),
      ],
    );

    blocTest(
      'Get filter Faq success',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.filterByFaqCategory(
          selectedCategory: FAQCategory('All'),
        ),
      ),
      expect: () => [
        faqState.copyWith(
          selectedCategory: FAQCategory('All'),
        ),
      ],
    );
    blocTest(
      'Get Search Faq success',
      build: () => FaqBloc(
        faqInfoRepository: repository,
        config: config,
      ),
      act: (FaqBloc bloc) => bloc.add(
        FaqEvent.updateSearchKey(
          searchKey: SearchKey.search('mock_search'),
        ),
      ),
      expect: () => [
        faqState.copyWith(
          searchKey: SearchKey.search('mock_search'),
        ),
      ],
    );

    group('Faq state -', () {
      test('showCategoryChip getter', () {
        expect(
          FaqState.initial()
              .copyWith(
                faqInfo: faqInfo,
                selectedCategory: FAQCategory('all'),
              )
              .showCategoryChip,
          true,
        );

        expect(
          FaqState.initial()
              .copyWith(searchKey: SearchKey.search('fake-key'))
              .showCategoryChip,
          true,
        );

        expect(
          FaqState.initial().showCategoryChip,
          false,
        );
      });

      test('selectedFaqItem getter', () {
        expect(
          FaqState.initial()
              .copyWith(
                faqInfo: faqInfo,
                selectedCategory: FAQCategory('all'),
              )
              .selectedFaqItem,
          faqInfo.faqList,
        );

        expect(
          FaqState.initial()
              .copyWith(
                faqInfo: faqInfo,
                selectedCategory: FAQCategory('General'),
              )
              .selectedFaqItem,
          faqInfo.faqList.take(6).toList(),
        );
      });

      test('getSearchedFaqList getter', () {
        expect(
          FaqState.initial()
              .copyWith(
                faqInfo: faqInfo,
                selectedCategory: FAQCategory('all'),
              )
              .getSearchedFaqList,
          faqInfo.faqList,
        );

        expect(
          FaqState.initial()
              .copyWith(
                faqInfo: faqInfo,
                selectedCategory: FAQCategory('all'),
                searchKey: SearchKey.search(
                  'Order and browse from over 500 healthcare manufacturers in Southeast Asia',
                ),
              )
              .getSearchedFaqList,
          [faqInfo.faqList[2]],
        );

        expect(
          FaqState.initial()
              .copyWith(
                faqInfo: faqInfo,
                selectedCategory: FAQCategory('all'),
                searchKey: SearchKey.search(
                  'What products can I order?',
                ),
              )
              .getSearchedFaqList,
          [faqInfo.faqList[2]],
        );
      });
    });
  });
}
