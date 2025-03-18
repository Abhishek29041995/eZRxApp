class NewPaymentQuery {
  String getCustomerOpenItemsQuery() {
    return '''
    query customerOpenItems(\$request: customerOpenItemsRequest!) {
      customerOpenItems(request: \$request) {
        total
        customerOpenItemsResponse {
          status
          accountingDocument
          netDueDate
          documentDate
          postingDate
          amountInTransactionCurrency
          documentReferenceID
          postingKeyName
          transactionCurrency
          accountingDocExternalReference
          bpCustomerNumber
          debitCreditCode
          cashDiscountAmountInDspCrcy
          cashDiscountDueDate
          totalAmountInDisplayCrcy
          displayCurrency
          openAmountInDisplayCrcy
          fiscalYear
          isDisputed
          accountingDocumentItem
          accountingDocumentItemRef
          partialPaymentHistoryDesc
          paymentAmountInDisplayCrcy
          companyCode
          openAmountInTransCrcy
          billingDocument
          orderId
        }
      }
    }
    ''';
  }

  String payQuery() {
    return '''
    mutation addCustomerPayment(\$input: addCustomerPaymentInput!) {
      addCustomerPayment(input: \$input) {
      paymentID
      paymentBatchAdditionalInfo
      valueDate
      transactionCurrency
      accountingDocExternalReference
      zCcpPaymentQRCode
      zzAdvice
      zzHtmcs
      adviceExpiry
    }
  }
    ''';
  }

  String updatePaymentGatewayQuery() {
    return '''
    mutation updatePaymentGatewayMutation(\$input: updatePaymentGatewayInput!) {
      updatePaymentGateway(input: \$input) {
        message
      }
    }''';
  }

  String getPaymentInvoiceInfoPdf() {
    return '''
    query paymentInvoicePdf(\$request: paymentInvoiceRequest!) {
      paymentInvoicePdf(request: \$request) {
        valueDate
        paymentID
        zzAdvice
        paymentDue
        paymentMethod
        customerName
        payer
        bankBeneficiary {
         beneficiaryName
         bankName
         branch
         bankCode
         bankAccount
         hdbcSwiftCode
         bankAddress
         payNowUen
         emailId
        }
        qrCode
        paymentBatchAdditionalInfo
        paymentItems {
          postingKeyName
          accountingDocument
          documentDate
          transactionCurrency
          paymentAmountInDisplayCrcy
          documentReferenceID
          debitCreditCode
        }
        salesDistrict
        footer
        headerLogoPath
        pleaseNote
        header
      }
    }
    ''';
  }

  String fetchPaymentMethodQuery() {
    return '''
    query availablePaymentMethods(\$request: availablePaymentMethodsRequest!) {
      availablePaymentMethods(request: \$request) {
        paymentMethods
        options {
            id
            type
            provider
            displayName
          }
      }
    }
    ''';
  }

  String createVirtualAccountQuery() {
    return '''
    mutation CreateVirtualAccount(\$input: createVirtualAccountRequest!) {
      createVirtualAccount(input: \$input) {
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
        paymentMethodDisplay
        createdOn
        paidOn
      }
    }
    ''';
  }

  String getPrincipalCutOffs() {
    return '''
    query GetPrincipalCutoffs(\$request: PrincipalCutoffRequest!) {
      getPrincipalCutoffs(request: \$request) {
        total
      }
    }
    ''';
  }
}
