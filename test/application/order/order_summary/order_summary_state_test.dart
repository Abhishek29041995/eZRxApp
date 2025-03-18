import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakePoDocuments = [
    PoDocuments.empty(),
    PoDocuments.empty(),
  ];
  group('OrderSummaryState', () {
    test(' => poDocumentsList should return simple list if isExpanded is false',
        () {
      final state = OrderSummaryState.initial();

      // Modify the state to have different values for orderHistoryDetails
      final modifiedState = state.copyWith(
        orderHistoryDetailsList: [
          OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPoDocuments: fakePoDocuments,
          ),
        ],
      );

      expect(modifiedState.poDocumentsList.length, 1);
      expect(modifiedState.poDocumentsList.first, isA<PoDocuments>());
    });

    test(' => poDocumentsList should return full list if isExpanded is true',
        () {
      final state = OrderSummaryState.initial();

      // Modify the state to have different values for isExpanded and orderHistoryDetails
      final modifiedState = state.copyWith(
        isExpanded: true,
        orderHistoryDetailsList: [
          OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPoDocuments: fakePoDocuments,
          ),
        ],
      );

      expect(modifiedState.poDocumentsList.length, 2);
      expect(modifiedState.poDocumentsList.first, isA<PoDocuments>());
    });

    test(' => displayShowMoreOrLess should return correct value', () {
      final state = OrderSummaryState.initial();

      // Modify the state to have different values for orderHistoryDetails
      final modifiedState = state.copyWith(
        orderHistoryDetailsList: [
          OrderHistoryDetails.empty().copyWith(
            orderHistoryDetailsPoDocuments: fakePoDocuments,
          ),
        ],
      );

      expect(modifiedState.displayShowMoreOrLess, true);
    });
  });
}
