import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_group.freezed.dart';

@freezed
class ViewByOrdersGroup with _$ViewByOrdersGroup {
  const ViewByOrdersGroup._();
  factory ViewByOrdersGroup({
    required DateTimeStringValue createdDate,
    required PrincipalName principalName,
    required List<OrderHistoryDetails> orderHeaders,
    required MaterialNumber parentId,
    required List<OrderHistoryDetailsOrderItem> viewByOrderItem,
  }) = _ViewByOrdersGroup;

  factory ViewByOrdersGroup.empty() => ViewByOrdersGroup(
        createdDate: DateTimeStringValue(''),
        orderHeaders: <OrderHistoryDetails>[],
        principalName: PrincipalName(''),
        parentId: MaterialNumber(''),
        viewByOrderItem: <OrderHistoryDetailsOrderItem>[],
      );

  MaterialInfo get bundleMaterial => viewByOrderItem
      .firstWhere(
        (element) => element.material.bundle != Bundle.empty(),
        orElse: () => OrderHistoryDetailsOrderItem.empty(),
      )
      .material
      .copyWith
      .bundle(
        materials: viewByOrderItem.map((e) => e.reOrderMaterialInfo).toList(),
      );
}
