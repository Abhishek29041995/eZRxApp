class PaymentSummaryQuery {
  String getPaymentSummaryQuery() {
    return '''
       query customerPayment(\$request: customerPaymentRequest!) {
        customerPayment(request: \$request) {
          total
          showing
          totalPaymentInProgress
          customerPaymentResponse {
            paymentID
            valueDate
            paymentAmount
            transactionCurrency
            paymentDocument
            invoiceProcessingStatus
            paymentMethod
            iban
            bankIdentification
            bankCountryKey
            bankKey
            bankAccountNumber
            bankName
            paymentCardID
            paymentCardNumber
            paymentCardHolderName
            paymentCardMaskedNumber
            paymentCardTypeName
            extensibilityCustomField {
              paymentBatchAdditionalInfo {
                businessContext
                label
                technicalName
              }
            }
            customId
            tmpPaytByDigitalPaytService
            payerByPaymentServiceProvider
            paymentRefByPaytSrvcProvider
            paymentServiceProvider
            transactionStatus
            customerInvoice
            paymentCardData
            paytCardVerificatDetResultText
            disputeCaseInformationText
            userName
            paymentBatchAdditionalInfo
            accountingDocExternalReference
            zCcpPaymentQRCode
            zzAdvice
            zzHtmcs
            adviceExpiry
            createdDate
            transactionStatus
            status
          }
        }
      }
    ''';
  }

  String getTransactions() {
    return '''
      query ListTransactions(\$request: listTxnParams!) {
        listTransactions(input: \$request) {
          TxnSummary {
            id
            customer
            customerName
            branch
            branchName
            paymentStatus
            paymentMethodDisplay
            amountDue
            reference
            createdOn
            paidOn
          }
          totalCount
        }
      }
    ''';
  }
}
