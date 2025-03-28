class PaymentCustomerInformationQueryMutation {
  // For fetching Payment Customer Information
  String getPaymentCustomerInformationQuery() {
    return '''
      query customerInformation(\$customer: String!,\$salesOrganisation: String!,\$filterBlockCustomer: Boolean,){
      customerInformation(customer: \$customer, salesOrganisation: \$salesOrganisation, filterBlockCustomer: \$filterBlockCustomer) {
        paymentTerm
           billTo {
      billToCustomerCode
      plant
      name1
      name2
      name3
      name4
      altName1
      altName2
      altName3
      altName4
      country
      region
      district
      postalCode
      postalCode2
      street
      street2
      street3
      street4
      street5
      houseNumber1
      houseNumber2
      building
      floor
      roomnumber
      telephoneNumber
      telephoneExtension
      faxNumber
      city1
      faxExtension
      city2
      status
      defaulBillToAddress
      taxIncludedBySalesOrganization
      taxNumber
      customerClassification
      customerLocalGroup
      emailAddresses
    }
        shipTo {
          defaultShipToAddress
          shipToCustomerCode
          name1
          name2
          name3
          name4
          plant
          street
          street2
          street3
          street4
          street5
          building
          floor
          houseNumber1
          postalCode
          city1
          city2
          status
          region
          telephoneNumber
          licenses{
            licenceType
            licenseDescription
            licenseNumber
            validFrom
            validTo
          }
        }
      }
    }
    ''';
  }
}
