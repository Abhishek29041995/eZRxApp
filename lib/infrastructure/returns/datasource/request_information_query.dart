class RequestInformationQuery {
  String getReturnInformationQuery(bool enableMarketplace) {
    return '''
       query requestInformationV2(\$request: requestInformationRequest!) {
  requestInformationV2(request: \$request) {
    requestHeader {
      soldTo
      refundTotal
      returnReference
      specialInstructions
      cName1
      requestID
      createdDate
      createdTime
      createdBy
      bapiStatus
      totalItemCount
      ${enableMarketplace ? 'isMarketPlace' : ''}
    }
    requestInformationV2 {
      ${enableMarketplace ? 'isMarketPlace' : ''}
      invoiceNo
      expiryDate
      comment
      remarks
      rejectReason
      returnTypeDesc
      returnType
      returnQuantity
      unitPrice
      totalPrice
      initialQuantity
      priceOverrideTrail {
          overriderRole
          overrideValue
      }
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
      attachmentUrl {
        fileName
        fileUrl
      }
      attachments
      priceDate
      createdDate
      overrideValue
      returnOrderDesc
      principal
      principalName
      prsfd
      bapiSalesDocNumber
      bapiStatus
      status
      statusReason
      outsidePolicy
      invoiceDate
      wareHouseStorageCondition
      bonusInformation {
      ${enableMarketplace ? 'isMarketPlace' : ''}
      invoiceNo
      expiryDate
      comment
      rejectReason
      returnTypeDesc
      returnType
      returnQuantity
      unitPrice
      totalPrice
      initialQuantity
      overrideValue
      materialNumber
      materialDescription
      batch
      materialGroup
      imageUrl
      attachmentUrl {
        fileName
        fileUrl
      }
      attachments
      priceDate
      createdDate
      returnOrderDesc
      principal
      principalName
      bapiSalesDocNumber
      bapiStatus
      status
      statusReason
      outsidePolicy
      invoiceDate
      priceOverrideTrail {
          overriderRole
          overrideValue
      }
      wareHouseStorageCondition
      }
    }
  }
}
    ''';
  }
}
