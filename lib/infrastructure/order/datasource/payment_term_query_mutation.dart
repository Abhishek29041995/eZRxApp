class PaymentTermsQueryMutation {
  /* Query for fetching the Available Payment Terms  */

  String getAvailablePaymentTerm() {
    return '''
    query availablePaymentTerm(\$salesOrganisation: String,\$language: String!,\$basePaymentTermCode: String!,\$soldToCustomerCode: String, \$principalCode: [String]){
      availablePaymentTerm(salesOrganisation:\$salesOrganisation,language:\$language,basePaymentTermCode:\$basePaymentTermCode, soldToCustomerCode: \$soldToCustomerCode, principalCode:\$principalCode)
      {
          paymentTermCode
          paymentTermRanking
          paymentTermDescription
          paymentTermSubranking
      }
    }
   ''';
  }
}
