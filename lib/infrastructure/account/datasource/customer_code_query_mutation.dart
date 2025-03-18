class CustomerCodeQueryMutation {
  // Query for fetching the customer information by search
  String getCustomerInfoBySearch(bool enableMarketplace) {
    return '''
query customerInformationSearch(
  \$salesOrganisation: String!
  \$searchKey: String!
  \$first: Int!
  \$after: Int!
  \$filterBlockCustomer: Boolean
  
) {
  customerInformationSearch(
    searchKey: \$searchKey
    salesOrganisation: \$salesOrganisation
    first: \$first
    after: \$after
    filterBlockCustomer: \$filterBlockCustomer
  ) {
    shipToCount
    SoldToInformation {
      customerCodeSoldTo
      telephoneNumber
      salesDeals
      paymentTerm
      paymentTermDescription
      customerGrp4
      customerAttr7
      name1
      name2
      name3
      name4
      street1
      street2
      street3
      street4
      building
      floor
      houseNumber1
      postalCode
      region
      city1
      city2
      status
      ${enableMarketplace ? 'isMarketPlace' : ''}
      division
      shipTo {
        defaultShipToAddress
        shipToCustomerCode
        name1
        name2
        name3
        name4
        street
        street2
        street3
        street4
        building
        floor
        houseNumber1
        postalCode
        region
        city1
        city2
        status
        targetCustomerType
        plant
        customerBlock
      }
    }
  }
}

    ''';
  }

  //TODO: Removed comboEligible and salesDeals fields so api can function properly with customer codes tagged
  // We need to add this later when we cover combo deals for KH market

  // Query for fetching the customer information for Sales Rep User
  String getCustomerListForSalesRep() {
    return '''
              query customerInformationSalesRep(
        \$customerInformationSalesRepInput: customerInformationSalesRepInput!
      ) {
        customerInformationSalesRep(input: \$customerInformationSalesRepInput) {
          shipToCount
          SoldToInformation {
            customerCodeSoldTo
            telephoneNumber
            name1
            name2
            name3
            name4
            street1
            street2
            street3
            street4
            building
            floor
            houseNumber1
            postalCode
            city1
            city2
            status
            salesDeals
            paymentTerm
            paymentTermDescription
            division
            shipTo {
              defaultShipToAddress
              shipToCustomerCode
              name1
              name2
              name3
              name4
              street
              street2
              street3
              street4
              building
              floor
              houseNumber1
              postalCode
              city1
              city2
              status
            }
          }
        }
      }    
    ''';
  }

  String getCustomerCodeConfig() {
    return '''
    query customerConfig(\$request: CustomerConfig!) {
      customerConfig(request: \$request ) {
        customerCode
        disableReturns
        disablePayments
      }
    }
    ''';
  }
}
