class StockInfoQueryMutation {
  String getMaterialStockInfoListQuery() {
    return '''
    query (\$request: GetStockInformationListsRequest!) {
      getStockInformationLists(request: \$request) {
        MaterialNumber
        StockInformation {
          MaterialNumber
          Batch
          ExpiryDate
          InStock
          ShelfLife
          SalesDistrict
          StockQuantity
        }
      }
    }
    ''';
  }
}
