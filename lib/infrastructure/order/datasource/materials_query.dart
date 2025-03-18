class ProductsQuery {
  String getProductQuery(
    bool enableMarketplace,
    bool enableProductTypeFilter,
  ) {
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
              MaterialCode
              Manufactured
              MaterialDescription
              DefaultMaterialDescription
              GenericMaterialName
              Manufactured
              GovernmentMaterialCode
              ItemRegistrationNumber
              ${enableMarketplace ? 'isMarketPlace' : ''}
            }
            DataTotalCount
            DataTotalHidden
            HidePrice
            IsGimmick
            ${enableProductTypeFilter ? '''
              IsPoison
              isSampleMaterial
            ''' : ''}
            hasValidTenderContract
            hasMandatoryTenderContract
          }
        }
      }
    ''';
  }

  String getProductDetailsQuery(bool enableMarketplace) {
    return '''
    query GetProductDetails(\$request: GetProductDetailsRequest!) {
      GetProductDetails(request: \$request) {
        Code
        Name
        Manufactured
        Type
        IsFavourite
        ${enableMarketplace ? 'isMarketPlace' : ''}
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
          MaterialCode
          Manufactured
          MaterialDescription
          DefaultMaterialDescription
          GenericMaterialName
          ItemRegistrationNumber
          ${enableMarketplace ? 'isMarketPlace' : ''}
        }
        DataTotalCount
        DataTotalHidden
        IsGimmick
      }
    }
    ''';
  }
}
