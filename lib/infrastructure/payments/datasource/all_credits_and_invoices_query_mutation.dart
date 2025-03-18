class AllCreditsAndInvoicesQueryMutation {
  String getDocumentHeaderListQuery() {
    return '''
    query customerDocumentHeaderV2(\$input: customerDocumentHeaderRequest!) {
      customerDocumentHeaderV2(request: \$input) {
          documentHeaderList {
          bpCustomerNumber
          fiscalYear
          accountingDocumentItem
          netDueDate
          referenceDocumentNumber
          postingDate
          amountInTransactionCurrency
          invoiceReference
          invoiceProcessingStatus
          accountingDocumentType
          accountingDocument
          postingKeyName
          deliveryFee
          discount
          manualFee
          taxAmount
          grossAmount
          netAmount
          documentDate
          debitCreditCode
          referenceId
          documentReferenceID
          orderId
        }
        totalCount
      }
      }
    ''';
  }
}
