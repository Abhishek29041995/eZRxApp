class ViewByOrderDetailsQueryMutation {
  String getOrderHistoryDetails(bool enableMarketPlace) {
    return '''
      query orderHistoryQuery(
  \$soldTo: String!, 
  \$fromDate: String, 
  \$toDate: String, 
  \$shipTo: [String], 
  \$first: Int, 
  \$after: Int, 
  \$orderBy: String, 
  \$sort: String, 
  \$language: String, 
  \$searchKey: String,
  ${enableMarketPlace ? '\$orderNumbers: [String],' : ''}   
  \$salesOrg: [String],
  \$status: [String],
  \$isDetailsPage: Boolean,
  ${enableMarketPlace ? '\$orderType: Int,' : ''}
 ) {
  orderHistoryV3(
   request: {
      soldTo: \$soldTo, 
      shipTo: \$shipTo, 
      fromDate: \$fromDate, 
      toDate: \$toDate, 
      first: \$first, 
      after: \$after, 
      orderBy: \$orderBy, 
      sort: \$sort, 
      language: \$language, 
      searchKey: \$searchKey,
      ${enableMarketPlace ? 'orderNumbers: \$orderNumbers,' : ''}  
      salesOrg: \$salesOrg,
      status: \$status,
      isDetailsPage: \$isDetailsPage, 
      ${enableMarketPlace ? 'orderType: \$orderType' : ''}
     }
  ) {
    orderCount
    creatingOrderIds
    orderHeaders {
      Type
      OrderNumber
      EZRXNumber
      SoldTo
      ShipTo
      ShipToAddres
      SoldToAddress
      CompanyName
      OrderValue
      DeliveryFee
      ManualFee
      ProcessingStatus
      CreatedDate
      CreatedTime
      RequestedDeliveryDate
      ExpectedDeliveryDate
      OrderBy
      TelephoneNumber
      POReference
      TotalTax
      TaxRate
      ReferenceNotes
      TotalValue
      SpecialInstructions
      PaymentMethod
      InvoiceNumber
      ${enableMarketPlace ? 'IsMarketPlace' : ''}
      PaymentTerm {
        PaymentTermCode
        PaymentTermDescription
      }
      TotalDiscount
      ItmCount
      HasPOAttachment
      ItmDescription
      PODocuments {
        Url
        Name
      }
      CustomerHolidays {
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday
      }
      OrderItems {
        isCounterOffer
        Type
        MaterialCode
        MaterialDescription
        DefaultMaterialDescription
        Qty
        PickedQuantity
        UnitPrice
        TotalUnitPrice
        TotalPrice
        LineReferenceNotes
        LineNumber
        Batch
        ExpiryDate
        SAPStatus
        Tax
        TotalTax
        TaxRate
        taxClassification
        ParentID
        PlannedDeliveryDate
        PrincipalName
        PrincipalCode
        ProductType
        ItemBrand
        HidePrice
        mrp
        promotype
        promoStatus
        isCovid
        ${enableMarketPlace ? 'IsMarketPlace' : ''}
        Batches {
          BatchNumber
          ExpiryDate
        }
        Details {
          DiscountCode
          DiscountDescription
          Rate
        }
        WarehouseStorageCondition
        GovernmentMaterialCode
        ItemRegistrationNumber
        IsTenderContractMaterial
        TenderContractDetails {
          ContractNumber
          isTenderExpire
          OrderReason
          Price
          PriceUnit
          ContractQuantity
          RemainingQuantity
          ExpiryDate
          ContractReference
          VisaNumber
          SalesDistrict
          AnnouncementLetterNumber
        }
      }
      OrderHolidays {
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday
      }
      IsGreen
    }
  }
}''';
  }
}
