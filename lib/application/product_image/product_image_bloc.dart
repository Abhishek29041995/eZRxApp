import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_bloc.freezed.dart';
part 'product_image_event.dart';
part 'product_image_state.dart';

class ProductImageBloc extends Bloc<ProductImageEvent, ProductImageState> {
  final IProductDetailRepository repository;

  ProductImageBloc({
    required this.repository,
  }) : super(ProductImageState.initial()) {
    on<ProductImageEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ProductImageEvent event,
    Emitter<ProductImageState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          ProductImageState.initial().copyWith(
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
          ),
        );
      },
      set: (e) {
        final updatedMap = {...state.productImageMap};
        for (final entry in e.productImageMap.entries) {
          if (!updatedMap.containsKey(entry.key)) {
            updatedMap[entry.key] = entry.value;
          }
        }
        emit(
          state.copyWith(
            isFetching: false,
            productImageMap: updatedMap,
          ),
        );
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        final materialNumbers = e.list.map((e) => e.materialNumber).toList();
        final queryMaterialNumber = List<MaterialNumber>.from(materialNumbers)
            .where((element) => !state.productImageMap.containsKey(element))
            .toSet()
            .toList();

        if (queryMaterialNumber.isEmpty) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }
        final failureOrSuccess = await repository.getProductsMetaData(
          materialNumbers: queryMaterialNumber,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
        );
        failureOrSuccess.fold(
          (_) {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );
          },
          (metaData) {
            if (!isClosed) {
              add(
                ProductImageEvent.set(productImageMap: metaData.imageMap),
              );
            }
          },
        );
      },
    );
  }
}
