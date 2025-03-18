class PaymentItemQuery {
  String getPaymentItemQuery() {
    return '''
      query paymentItems(\$request: paymentItemsRequest!) {
  paymentItems(request: \$request) {
    accountingDocument
    accountingDocumentItem
    netDueDate
    postingDate
    documentDate
    transactionCurrency
    paymentAmountInDisplayCrcy
    postingKeyName
    documentReferenceID
    debitCreditCode
  }
} 
    ''';
  }

  String deleteCustomerPaymentQuery() {
    return '''
        mutation deleteCustomerPayment(\$input: deleteCustomerPaymentInput!) {
          deleteCustomerPayment(input: \$input) {
              statusMessage
          }
      }
    ''';
  }

  String getTransactionQuery() {
    return '''
      query (\$input: getTxnParams!) {
        getTransaction(input: \$input) {
          id
          reference
          invoices {
            documentDate
            documentType
            documentNo
            amount
          }
          amountPayable
          status
          paymentDetails {
            vaNumber
            vaName
            externalLink
            expiresAt
          }
          paymentMethodDisplay
          createdOn
          bankId
          paidOn
        }
      }
    ''';
  }

  String getCancelVirtualAccountQuery() {
    return '''
       mutation CancelVirtualTxn(\$input: cancelVirtualAccountRequest!) {
        cancelVirtualAccount(input: \$input) {
            id
            invoices {
                documentDate
                documentType
                documentNo
                amount
            }
            amountPayable
            status
            paymentDetails {
                vaNumber
                vaName
                expiresAt
            }
            createdOn
            paidOn
        }
    }
    ''';
  }
}
