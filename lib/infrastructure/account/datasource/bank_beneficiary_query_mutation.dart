class BankBeneficiaryQueryMutation {
  String getBankBeneficiaryQuery() {
    return '''
      query bankBeneficiary(\$request: bankBeneficiaryRequest!) {
        bankBeneficiary(request: \$request) {
        salesOrg
        salesDistrict
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
    }
    ''';
  }
}
