class CustomerLicenseQuery {
  String getCustomerLicense() {
    return '''
     query customerLicenses(\$customerCodes: [String!]!, 
     \$salesOrganisation: String!, 
     \$language: String!, 
     \$filterBlockCustomer: Boolean!, 
     \$first: Int!, \$after: Int!, 
     \$orderBy: String!) {
      customerLicenses(
        customerCodes: \$customerCodes
        salesOrganisation: \$salesOrganisation
        language: \$language
        filterBlockCustomer: \$filterBlockCustomer
        first: \$first
        after: \$after
        orderBy: \$orderBy
      ) {
        Total
        Licenses {
          licenceType
          licenseNumber
          validFrom
          validTo
          licenseDescription
          status
        }
      }
    }
    ''';
  }
}
