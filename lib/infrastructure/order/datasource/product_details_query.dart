class ProductDetailQuery {
  String getMaterialDetails(
    bool enableMarketplace,
    bool enableProductTypeFilter,
  ) {
    return '''
     query materialDetails(
        \$materialNumber: String!,
        \$language: String, 
        \$salesOrg: String, 
        \$customerCode: String, 
        \$shipToCode: String
        ) {
      materialDetails(
        materialNumber:\$materialNumber
        language: \$language
        salesOrg: \$salesOrg
        customerCode: \$customerCode
        shipToCode: \$shipToCode
      ) {
        materialNumber
        materialDescription
        principalCode
        principalName
        unitOfMeasurement
        therapeuticClass
        genericMaterialName
        itemBrand
        promoStatus
        promoType
        materialBrand
        isFavourite
        isFOCMaterial
        ${enableMarketplace ? 'isMarketPlace' : ''}
        defaultMaterialDescription
        country
        countryName
        hidePrice
        governmentMaterialCode
        itemRegistrationNumber
        suspensionStatus
        hasMandatoryTenderContract
        hasValidTenderContract
        ${enableProductTypeFilter ? '''
          isPoison
          isGimmick
          isSampleMaterial
        ''' : ''}

      }
    }
     ''';
  }

  String getSimilarProductQuery(bool enableMarketplace) {
    return '''
      query (\$request: GetAllProductsRequest!) {
        GetAllProducts(request: \$request) {
          Count
          Products {
            Code
            Name
            PrincipalCode
            materialNumber
            materialDescription
            Manufactured
            IsFavourite
            isFOCMaterial
            ${enableMarketplace ? 'isMarketPlace' : ''}
            materialGroup4
            Type
            HidePrice
            BundleInformation {
              BundleName
              BundleCode
              Conditions
              BonusEligible
              BundleInformation {
                Sequence
                Quantity
                Type
                Rate
              }
            }
            Data {
              Active
              MaterialCode
              Manufactured
              MaterialDescription
              DefaultMaterialDescription
              GenericMaterialName
              Manufactured
              MaterialImageURL
              GovernmentMaterialCode
              ItemRegistrationNumber
            }
            DataTotalCount
            DataTotalHidden
            HidePrice
            IsGimmick
          }
        }
      }
    ''';
  }

  String getProductMetaData() {
    return '''
      query GetProductResponse(\$request: GetProductRequest!) {
        getProduct(request: \$request) {
          orderCloudProduct {
            materialID
            name
            description
            image
            thumbNail
            isFavourite
          }
          Items {
            PromotionMaterial
            HidePrice
            ID
            XP {
              Dosage
              HowToUse
              Composition
              DeliveryInstructions
            }
          }
        }
      }
      ''';
  }
}
