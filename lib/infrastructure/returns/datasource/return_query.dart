class ReturnQuery {
  String getRequestsByItems(bool enableMarketplace) {
    return '''
      query requestsByItems(\$request: requestsByItems!) {
        requestsByItems(request: \$request) {
          returnRequestsByItems {
            requestDate
            requestByItems {
              prsfd
              requestId
              requestDate
              itemQty
              totalPrice
              status
              materialNumber
              materialName
              DefaultMaterialDescription
              orderNumber
              invoiceID
              customerName
              batch
              expiry
              outsidePolicy
              ${enableMarketplace ? 'isMarketPlace' : ''}
              lineItemNumber
              wareHouseStorageCondition
            }
          }
          totalCount
        }
      }
    ''';
  }

  String getRequestsByRequest(bool enableMarketplace) {
    return '''
      query requestsByUserV3(\$requestsByUserRequest: requestsByUserRequestV3!) {
        requestsByUserV3(request: \$requestsByUserRequest) {
          returnRequests {
            requestId
            requestDate
            itemQty
            totalPrice
            status
            customerName
            ${enableMarketplace ? 'isMarketPlace' : ''}
          }
          totalCount
        }
      }
    ''';
  }

  String getRequestsByItemsExcel() {
    return '''
     query requestsByItemsExcel(\$input: requestsByItemsExcel!) {
        requestsByItemsExcel(request: \$input) {
          url
        }
      }
    ''';
  }
}
