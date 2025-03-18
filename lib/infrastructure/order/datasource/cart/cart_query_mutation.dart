class CartQueryMutation {
  String cart(
    bool enableMarketplace,
    bool enableProductTypeFilter,
  ) =>
      '''
  fragment BundleMaterialsFields on Item {
    Type
    ProductID
    ItemSource
    Quantity
    CreatedAt
    UpdatedAt
    principalCode
    principalName
    materialNumber
    materialDescription
    therapeuticClass
    itemBrand
    governmentMaterialCode
    defaultMaterialDescription
    oldMaterialCode
    materialGroup4
    materialGroup2
    taxClassification
    unitOfMeasurement
    itemRegistrationNumber
    genericMaterialName
    language
    taxM1
    taxes
    isSampleMaterial
    hidePrice
    hasValidTenderContract
    hasMandatoryTenderContract
    isFOCMaterial
    isFavourite
    productCount
    productAddedAt
    productUpdatedAt
    minimumQty
    maximumQty
    orderedQty
    remainingQty
    mov
    ${enableMarketplace ? 'isMarketPlace' : ''}
    IsGimmick
    ${enableProductTypeFilter? '''
      IsPoison
      IsSample
    ''': ''}
    materialType
    suspensionStatus
    principalCutoffStatus
    warehouseStorageCondition
    ParentID
  } 
  fragment ComboMaterialsFields on Item {
    Type
    ProductID
    ItemSource
    Quantity
    CreatedAt
    UpdatedAt
    principalCode
    principalName
    materialNumber
    materialDescription
    therapeuticClass
    itemBrand
    governmentMaterialCode
    defaultMaterialDescription
    oldMaterialCode
    materialGroup4
    materialGroup2
    taxClassification
    unitOfMeasurement
    itemRegistrationNumber
    genericMaterialName
    language
    taxM1
    taxes
    isSampleMaterial
    hidePrice
    hasValidTenderContract
    hasMandatoryTenderContract
    isFOCMaterial
    isFavourite
    productCount
    productAddedAt
    productUpdatedAt
    minimumQty
    maximumQty
    orderedQty
    remainingQty
    mov
    ${enableMarketplace ? 'isMarketPlace' : ''}
    IsGimmick
    ${enableProductTypeFilter? '''
      IsPoison
      IsSample
    ''': ''}
    materialType
    suspensionStatus
    principalCutoffStatus
    warehouseStorageCondition
    ParentID
    Rate
    ConditionNumber
    Mandatory
    Suffix
    ListPrice
    ItemCheck
    Valid
    SetNo
    ComboDealType
    IsComboEligible
    FinalIndividualPrice
    PrimaryMaterialNumber
    __typename
}

  query Cart(\$language: String) {
  cart(language: \$language) {
    ID
    UserID
    EzRxItems {
      BundleDetails {
        BundleName
        BundleCode
        BundleInformation {
          Sequence
          Quantity
          Type
          Rate
        }
      }
      BundleMaterials {
        ...BundleMaterialsFields
      }
      ComboMaterials {
        ...ComboMaterialsFields
      }
      ComboDeals {
        Eligible
        FlexibleGroup
        SalesDeal
        Category {
          Type
          Value
        }
      }
      CounterOfferPrice
      CounterOfferCurrency
      DiscountOverridePercentage
      isVaccine
      TenderContractNumber
      Comment
      ProductID
      ParentID
      Type
      ItemSource
      Quantity
      CreatedAt
      UpdatedAt
      principalCode
      principalName
      materialNumber
      materialDescription
      therapeuticClass
      itemBrand
      oldMaterialCode
      governmentMaterialCode
      materialGroup4
      materialGroup2
      taxClassification
      unitOfMeasurement
      itemRegistrationNumber
      defaultMaterialDescription
      genericMaterialName
      language
      taxM1
      taxes
      isSampleMaterial
      hidePrice
      hasValidTenderContract
      hasMandatoryTenderContract
      isFOCMaterial
      isTenderExpired
      isFavourite
      productCount
      productAddedAt
      productUpdatedAt
      minimumQty
      maximumQty
      orderedQty
      remainingQty
      mov
      ${enableMarketplace ? 'isMarketPlace' : ''}
      materialType
      suspensionStatus
      principalCutoffStatus
      warehouseStorageCondition
      IsGimmick
      ${enableProductTypeFilter? '''
        IsPoison
        IsSample
      ''': ''}
      tenderOrderReason
      TenderContractNumber
      is26SeriesMaterial
      isTenderExpired
      isCovid
      BonusMaterials {
        principalCode
        principalName
        materialNumber
        materialDescription
        defaultMaterialDescription
        productCount
        ItemId
        Type
        itemRegistrationNumber
      }
    }
    MarketplaceItems {
      ProductID
      ItemSource
      Quantity
      CreatedAt
      UpdatedAt
    }
    CustomerCode,
    ShipToCustomerCode,
    CreatedAt
    UpdatedAt
    OrderID
    WorkSheet {
      ShipEstimateResponse {
        ShipEstimates
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderCalculateResponse {
        LineItemOverrides
        ShippingTotal
        TaxTotal
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderSubmitResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderSubmitForApprovalResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderApprovedResponse {
        HttpStatusCode
        UnhandledErrorBody
        xp
        Succeeded
      }
      OrderPromotions {
        Amount
        LineItemID
        ID
        LineItemLevel
        Code
        Name
        RedemptionLimit
        RedemptionLimitPerUser
        RedemptionCount
        Description
        FinePrint
        StartDate
        ExpirationDate
        EligibleExpression
        ValueExpression
        CanCombine
        AllowAllBuyers
        OwnerID
        xp {
          IntegrationData
          Status
          HasVariants
          Note
          ProductType
          SizeTier
          IsResale
          Currency
          ArtworkRequired
          PromotionEligible
          FreeShipping
          FreeShippingMessage
          Documents {
            Url
            FileName
          }
          Images {
            Url
            ThumbnailUrl
            Tags
          }
          Accessorials
          UnitOfMeasure {
            Qty
            Unit
          }
          Tax {
            Code
            Description
            LongDescription
          }
          Facets {
            greenlabel
            countryoforigin
            computer
            animaux
            category
            industry
            supplier
          }
          Brand
          CountryOfOrigin
          TherapeuticClass
          ShippingZuelligPharma
          ShippingDirectToBuyer
          ShippingStandard
          Company
          CustomerRating
          Manufacturer
          ProductRegistrationNumber
          SupplierProductCode
          ProductBatch {
            BatchNumber
            BatchExpirationDate
            BatchStockQuantity
          }
          Workflow {
            RejectionReason
          }
          Promotions
        }
      }
      LineItems {
        ID
        ProductID
        Quantity
        DateAdded
        QuantityShipped
        UnitPrice
        PromotionDiscount
        LineTotal
        LineSubtotal
        CostCenter
        DateNeeded
        ShippingAccount
        ShippingAddressID
        ShipFromAddressID
        Variant
        ShippingAddress
        SupplierID
        InventoryRecordID
        PriceScheduleID
        PriceOverridden
        Specs
        ShipFromAddress {
          ID
          DateCreated
          CompanyName
          FirstName
          LastName
          Street1
          Street2
          City
          State
          Zip
          Country
          Phone
          AddressName
          xp
        }
        Product {
          ID
          Name
          Description
          Returnable
          QuantityMultiplier
          ShipWeight
          ShipHeight
          ShipWidth
          ShipLength
          DefaultSupplierID
          xp {
            IntegrationData
            Status
            HasVariants
            Note
            ProductType
            SizeTier
            IsResale
            Currency
            ArtworkRequired
            PromotionEligible
            FreeShipping
            FreeShippingMessage
            Documents {
              Url
              FileName
            }
            Images {
              Url
              ThumbnailUrl
              Tags
            }
            Accessorials
            UnitOfMeasure {
              Qty
              Unit
            }
            Tax {
              Code
              Description
              LongDescription
            }
            Facets {
              greenlabel
              countryoforigin
              computer
              animaux
              category
              industry
              supplier
            }
            Brand
            CountryOfOrigin
            TherapeuticClass
            ShippingZuelligPharma
            ShippingDirectToBuyer
            ShippingStandard
            Company
            CustomerRating
            Manufacturer
            ProductRegistrationNumber
            SupplierProductCode
            ProductBatch {
              BatchNumber
              BatchExpirationDate
              BatchStockQuantity
            }
            Workflow {
              RejectionReason
            }
            Promotions
          }
        }
        xp {
          IntegrationData
          Status
          HasVariants
          Note
          ProductType
          SizeTier
          IsResale
          Currency
          ArtworkRequired
          PromotionEligible
          FreeShipping
          FreeShippingMessage
          Documents {
            Url
            FileName
          }
          Images {
            Url
            ThumbnailUrl
            Tags
          }
          Accessorials
          UnitOfMeasure {
            Qty
            Unit
          }
          Tax {
            Code
            Description
            LongDescription
          }
          Facets {
            greenlabel
            countryoforigin
            computer
            animaux
            category
            industry
            supplier
          }
          Brand
          CountryOfOrigin
          TherapeuticClass
          ShippingZuelligPharma
          ShippingDirectToBuyer
          ShippingStandard
          Company
          CustomerRating
          Manufacturer
          ProductRegistrationNumber
          SupplierProductCode
          ProductBatch {
            BatchNumber
            BatchExpirationDate
            BatchStockQuantity
          }
          Workflow {
            RejectionReason
          }
          Promotions
        }
      }
      Order {
        ID
        FromCompanyID
        ToCompanyID
        FromUserID
        BillingAddressID
        BillingAddress
        ShippingAddressID
        Comments
        LineItemCount
        Status
        DateCreated
        DateSubmitted
        DateApproved
        DateDeclined
        DateCanceled
        DateCompleted
        LastUpdated
        Subtotal
        ShippingCost
        TaxCost
        PromotionDiscount
        Currency
        Total
        IsSubmitted
        FromUser {
          ID
          CompanyID
          Username
          Password
          FirstName
          LastName
          Email
          Phone
          TermsAccepted
          Active
          AvailableRoles
          Locale
          DateCreated
          PasswordLastSetDate
        }
      }
    }
  }
}
  ''';

  String deleteCartMutation() => '''
    mutation DeleteCart {
      deleteCart {
        Type
        Message
      }
    }
''';

  String upsertCart(
    bool enableMarketplace,
    bool enableProductTypeFilter,
  ) =>
      '''
    mutation UpsertCart(\$itemInput: ItemInput!) {
      upsertCart(itemInput: \$itemInput) {
        ID
        UserID
        EzRxItems {
          TenderContractNumber
          tenderOrderReason
          isTenderExpired
          IsGimmick
          ${enableProductTypeFilter? '''
            IsPoison
            IsSample
          ''': ''}
          Type
          ProductID
          ItemSource
          Quantity
          CreatedAt
          UpdatedAt
          principalCode
          principalName
          materialNumber
          materialDescription
          therapeuticClass
          itemBrand
          oldMaterialCode
          governmentMaterialCode
          materialGroup4
          materialGroup2
          taxClassification
          unitOfMeasurement
          itemRegistrationNumber
          defaultMaterialDescription
          genericMaterialName
          language
          taxM1
          taxes
          isSampleMaterial
          hidePrice
          hasValidTenderContract
          hasMandatoryTenderContract
          isFOCMaterial
          isFavourite
          productCount
          productAddedAt
          productUpdatedAt
          minimumQty
          maximumQty
          orderedQty
          remainingQty
          mov
          ${enableMarketplace ? 'isMarketPlace' : ''}
          materialType
          suspensionStatus
          principalCutoffStatus
          warehouseStorageCondition
          CounterOfferPrice	
          CounterOfferCurrency
          DiscountOverridePercentage
          is26SeriesMaterial
          isCovid	
          Comment
          BonusMaterials {
            principalCode
            principalName
            ItemId
            materialNumber
            materialDescription
            defaultMaterialDescription
            productCount
            Type
            itemRegistrationNumber
          }
          BundleDetails {
            BundleName
            BundleCode
            BundleInformation {
              Sequence
              Quantity
              Type
              Rate
            }
          }
          BundleMaterials {
            Type
            ProductID
            ItemSource
            Quantity
            CreatedAt
            UpdatedAt
            principalCode
            principalName
            materialNumber
            materialDescription
            therapeuticClass
            itemBrand
            governmentMaterialCode
            defaultMaterialDescription
            oldMaterialCode
            materialGroup4
            materialGroup2
            taxClassification
            unitOfMeasurement
            itemRegistrationNumber
            genericMaterialName
            language
            taxM1
            taxes
            isSampleMaterial
            hidePrice
            hasValidTenderContract
            hasMandatoryTenderContract
            isFOCMaterial
            isFavourite
            productCount
            productAddedAt
            productUpdatedAt
            minimumQty
            maximumQty
            orderedQty
            remainingQty
            mov
            materialType
            suspensionStatus
            principalCutoffStatus
            warehouseStorageCondition
            ParentID
          }
          ComboDeals {
            Eligible
            FlexibleGroup
            SalesDeal
            Category {
              Type
              Value
            }
          }
          ComboMaterials {
            Type
            ProductID
            ItemSource
            Quantity
            CreatedAt
            UpdatedAt
            principalCode
            principalName
            materialNumber
            materialDescription
            therapeuticClass
            itemBrand
            governmentMaterialCode
            defaultMaterialDescription
            oldMaterialCode
            materialGroup4
            materialGroup2
            taxClassification
            unitOfMeasurement
            itemRegistrationNumber
            genericMaterialName
            language
            taxM1
            taxes
            isSampleMaterial
            hidePrice
            hasValidTenderContract
            hasMandatoryTenderContract
            isFOCMaterial
            isFavourite
            productCount
            productAddedAt
            productUpdatedAt
            minimumQty
            maximumQty
            orderedQty
            remainingQty
            mov
            materialType
            suspensionStatus
            principalCutoffStatus
            warehouseStorageCondition
            ParentID
            Rate
            ConditionNumber
            Mandatory
            Suffix
            ListPrice
            ItemCheck
            Valid
            SetNo
            ComboDealType
            IsComboEligible
            FinalIndividualPrice
            PrimaryMaterialNumber
          }
        }
        MarketplaceItems {
          ProductID
          ItemSource
          Quantity
          CreatedAt
          UpdatedAt
          CounterOfferPrice	
          CounterOfferCurrency	
          Comment
        }
        CustomerCode
        ShipToCustomerCode
        CreatedAt
        UpdatedAt
        OrderID
        WorkSheet {
          ShipEstimateResponse {
            ShipEstimates
            HttpStatusCode
            UnhandledErrorBody
            xp
            Succeeded
          }
          OrderCalculateResponse {
            LineItemOverrides
            ShippingTotal
            TaxTotal
            HttpStatusCode
            UnhandledErrorBody
            xp
            Succeeded
          }
          OrderSubmitResponse {
            HttpStatusCode
            UnhandledErrorBody
            xp
            Succeeded
          }
          OrderSubmitForApprovalResponse {
            HttpStatusCode
            UnhandledErrorBody
            xp
            Succeeded
          }
          OrderApprovedResponse {
            HttpStatusCode
            UnhandledErrorBody
            xp
            Succeeded
          }
          OrderPromotions {
            Amount
            LineItemID
            ID
            LineItemLevel
            Code
            Name
            RedemptionLimit
            RedemptionLimitPerUser
            RedemptionCount
            Description
            FinePrint
            StartDate
            ExpirationDate
            EligibleExpression
            ValueExpression
            CanCombine
            AllowAllBuyers
            OwnerID
            xp {
              IntegrationData
              Status
              HasVariants
              Note
              ProductType
              SizeTier
              IsResale
              Currency
              ArtworkRequired
              PromotionEligible
              FreeShipping
              FreeShippingMessage
              Documents {
                Url
                FileName
              }
              Images {
                Url
                ThumbnailUrl
                Tags
              }
              Accessorials
              UnitOfMeasure {
                Qty
                Unit
              }
              Tax {
                Code
                Description
                LongDescription
              }
              Facets {
                greenlabel
                countryoforigin
                computer
                animaux
                category
                industry
                supplier
              }
              Brand
              CountryOfOrigin
              TherapeuticClass
              ShippingZuelligPharma
              ShippingDirectToBuyer
              ShippingStandard
              Company
              CustomerRating
              Manufacturer
              ProductRegistrationNumber
              SupplierProductCode
              ProductBatch {
                BatchNumber
                BatchExpirationDate
                BatchStockQuantity
              }
              Workflow {
                RejectionReason
              }
              Promotions
            }
          }
          LineItems {
            ID
            ProductID
            Quantity
            DateAdded
            QuantityShipped
            UnitPrice
            PromotionDiscount
            LineTotal
            LineSubtotal
            CostCenter
            DateNeeded
            ShippingAccount
            ShippingAddressID
            ShipFromAddressID
            Variant
            ShippingAddress
            SupplierID
            InventoryRecordID
            PriceScheduleID
            PriceOverridden
            Specs
            ShipFromAddress {
              ID
              DateCreated
              CompanyName
              FirstName
              LastName
              Street1
              Street2
              City
              State
              Zip
              Country
              Phone
              AddressName
              xp
            }
            Product {
              ID
              Name
              Description
              Returnable
              QuantityMultiplier
              ShipWeight
              ShipHeight
              ShipWidth
              ShipLength
              DefaultSupplierID
              xp {
                IntegrationData
                Status
                HasVariants
                Note
                ProductType
                SizeTier
                IsResale
                Currency
                ArtworkRequired
                PromotionEligible
                FreeShipping
                FreeShippingMessage
                Documents {
                  Url
                  FileName
                }
                Images {
                  Url
                  ThumbnailUrl
                  Tags
                }
                Accessorials
                UnitOfMeasure {
                  Qty
                  Unit
                }
                Tax {
                  Code
                  Description
                  LongDescription
                }
                Facets {
                  greenlabel
                  countryoforigin
                  computer
                  animaux
                  category
                  industry
                  supplier
                }
                Brand
                CountryOfOrigin
                TherapeuticClass
                ShippingZuelligPharma
                ShippingDirectToBuyer
                ShippingStandard
                Company
                CustomerRating
                Manufacturer
                ProductRegistrationNumber
                SupplierProductCode
                ProductBatch {
                  BatchNumber
                  BatchExpirationDate
                  BatchStockQuantity
                }
                Workflow {
                  RejectionReason
                }
                Promotions
              }
            }
            xp {
              IntegrationData
              Status
              HasVariants
              Note
              ProductType
              SizeTier
              IsResale
              Currency
              ArtworkRequired
              PromotionEligible
              FreeShipping
              FreeShippingMessage
              Documents {
                Url
                FileName
              }
              Images {
                Url
                ThumbnailUrl
                Tags
              }
              Accessorials
              UnitOfMeasure {
                Qty
                Unit
              }
              Tax {
                Code
                Description
                LongDescription
              }
              Facets {
                greenlabel
                countryoforigin
                computer
                animaux
                category
                industry
                supplier
              }
              Brand
              CountryOfOrigin
              TherapeuticClass
              ShippingZuelligPharma
              ShippingDirectToBuyer
              ShippingStandard
              Company
              CustomerRating
              Manufacturer
              ProductRegistrationNumber
              SupplierProductCode
              ProductBatch {
                BatchNumber
                BatchExpirationDate
                BatchStockQuantity
              }
              Workflow {
                RejectionReason
              }
              Promotions
            }
          }
          Order {
            ID
            FromCompanyID
            ToCompanyID
            FromUserID
            BillingAddressID
            BillingAddress
            ShippingAddressID
            Comments
            LineItemCount
            Status
            DateCreated
            DateSubmitted
            DateApproved
            DateDeclined
            DateCanceled
            DateCompleted
            LastUpdated
            Subtotal
            ShippingCost
            TaxCost
            PromotionDiscount
            Currency
            Total
            IsSubmitted
            FromUser {
              ID
              CompanyID
              Username
              Password
              FirstName
              LastName
              Email
              Phone
              TermsAccepted
              Active
              AvailableRoles
              Locale
              DateCreated
              PasswordLastSetDate
            }
          }
        }
      }
    }
  ''';

  String upsertCartItems(
    bool enableMarketplace,
    bool enableProductTypeFilter,
  ) =>
      '''
fragment ezrxItemsFields on Item {
  ProductID
  ItemSource
  Quantity
  CreatedAt
  UpdatedAt
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  TenderContractNumber
  tenderOrderReason
  isTenderExpired
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  IsGimmick
  ${enableProductTypeFilter? '''
    IsPoison
    IsSample
  ''': ''}
  is26SeriesMaterial
  isCovid
  ${enableMarketplace ? 'isMarketPlace' : ''}
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
  ParentID
  BonusMaterials {
    principalCode
    principalName
    materialNumber
    materialDescription
    defaultMaterialDescription
    productCount
    ProductID
    ItemId
    Type
    itemRegistrationNumber
  }
  Type
  BundleDetails {
    BundleName
    BundleCode
    BundleInformation {
      Sequence
      Quantity
      Type
      Rate
    }
  }
  BundleMaterials {
    ...BundleMaterialsFields
  }
   ComboMaterials {
        ...ComboMaterialsFields
      }
      ComboDeals {
        Eligible
        FlexibleGroup
        SalesDeal
        Category {
          Type
          Value
        }
      }
}

fragment userAddressFields on CartShippingAddress {
  name
  street
  city
  addressCode
  country
}

fragment materialsFields on CartMaterials {
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
}

fragment BundleMaterialsFields on Item {
  Type
  ProductID
  ItemSource
  Quantity
  CreatedAt
  UpdatedAt
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  ${enableMarketplace ? 'isMarketPlace' : ''}
  IsGimmick
  ${enableProductTypeFilter? '''
    IsPoison
    IsSample
  ''': ''}
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
  ParentID
}

fragment ComboMaterialsFields on Item {
  Type
  ProductID
  ItemSource
  Quantity
  CreatedAt
  UpdatedAt
  principalCode
  principalName
  materialNumber
  materialDescription
  therapeuticClass
  itemBrand
  governmentMaterialCode
  defaultMaterialDescription
  oldMaterialCode
  materialGroup4
  materialGroup2
  taxClassification
  unitOfMeasurement
  itemRegistrationNumber
  genericMaterialName
  language
  taxM1
  taxes
  isSampleMaterial
  hidePrice
  hasValidTenderContract
  hasMandatoryTenderContract
  isFOCMaterial
  isFavourite
  productCount
  productAddedAt
  productUpdatedAt
  minimumQty
  maximumQty
  orderedQty
  remainingQty
  mov
  ${enableMarketplace ? 'isMarketPlace' : ''}
  IsGimmick
  ${enableProductTypeFilter? '''
    IsPoison
    IsSample
  ''': ''}
  materialType
  suspensionStatus
  principalCutoffStatus
  warehouseStorageCondition
  ParentID
  Rate
  ConditionNumber
  Mandatory
  Suffix
  ListPrice
  ItemCheck
  Valid
  SetNo
  ComboDealType
  IsComboEligible
  FinalIndividualPrice
  PrimaryMaterialNumber
}

mutation UpsertCartItems(\$itemInput: [ItemInput!]) {
  upsertCartItems(itemInput: \$itemInput) {
    ID
    UserID
    EzRxItems {
      ...ezrxItemsFields
    }
    CustomerCode
    ShipToCustomerCode,
    CreatedAt
    UpdatedAt
    OrderID
    userAddress {
      ...userAddressFields
    }
    materials {
      ...materialsFields
    }
    SalesOrg
  }
}
''';

  String aplSimulateOrderQuery() => '''
    query aplSimulateOrder(\$input: AplSimulateOrderRequest!) {
      aplSimulateOrder(input: \$input) {
        netTotalValue
        tax
        totalDiscValue
        beforeTax
        deliveryFee
        products {
          type
          itemNumber
          parentItemNumber
          material
          productQty
          productPriceNetValue
          taxValue
          netValue
          promotions {                  
            discountValue              
            discountTypeValue 
            }
        }
      }
    }
    ''';

  String aplGetTotalPrice() => '''
    query aplGetTotalPrice(\$AplGetTotalPrice: AplGetTotalPriceRequest!) {
      AplGetTotalPrice(request: \$AplGetTotalPrice) {
        TotalPrice
        DeliveryFee
        Tax
      }
    }
    ''';
}
