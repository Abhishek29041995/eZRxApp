class CreditAndInvoiceDetailsQueryMutation {
  String getCreditAndInvoiceDetails() {
    return '''
    query customerDocumentDetails(\$input: customerDocumentDetailsRequest!) {
      customerDocumentDetails(request: \$input) {
        billingDocumentItem
        salesDocumentItemType
        material
        billingDocumentItemText
        billingQuantity
        billingQuantityUnit
        salesMeasureISOUnit
        referenceSDDocument
        referenceSDDocumentItem
        referenceSDDocumentCategory
        grossAmount
        netAmount
        taxAmount
        principalName
        principalCode
        batches {
          batchNumber
          expiryDate
        }
      }
    }
    ''';
  }
}
