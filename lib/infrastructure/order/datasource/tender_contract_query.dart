class TenderContractQuery {
  String getTenderContractDetails() {
    return '''
    query tenderContractDetails(\$request: TenderContractDetailsRequest!) {
        tenderContractDetails(request: \$request) {
          tenderContractDetails {
            contractNumber
            contractItemNumber
            contractReference
            tenderOrderReason
            tenderVisaNumber
            salesDistrict
            tenderPackageDescription
            tenderPrice
            pricingUnit
            remainingTenderQuantity
            contractQuantity
            contractExpiryDate
            announcementLetterNumber
            isNearToExpire
            contractPaymentTerm
            tenderUnitPrice
          }
        }
      }    
    ''';
  }
}
