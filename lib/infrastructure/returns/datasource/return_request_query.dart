class ReturnRequestQuery {
  String searchReturnMaterials(bool enableMarketplace) {
    return '''
      fragment MaterialsFields on returnMaterialInformation {
        item {
          assignmentNumber
          material
          materialDescription
          DefaultMaterialDescription
          balanceQuantity
          targetQuantity
          batch
          eligibleForReturn
          priceDate
          unitPrice
          totalPrice
          principalCode
          principalName
          expiryDate
          itemNumber
          outsidePolicy
          ${enableMarketplace ? 'isMarketPlace' : ''}
          wareHouseStorageCondition
          bonusItem {
            assignmentNumber
            material
            materialDescription
            DefaultMaterialDescription
            balanceQuantity
            targetQuantity
            eligibleForReturn
            batch
            priceDate
            unitPrice
            totalPrice
            principalCode
            principalName
            expiryDate
            itemNumber
            outsidePolicy
            ${enableMarketplace ? 'isMarketPlace' : ''}
            wareHouseStorageCondition
          }
        }
      }

      fragment materialBasicInformation on materialBasicInfo {
        salesOrg
        partnerRole
        partnerNumber
      }

      query searchReturnMaterials(\$searchReturnMaterialsRequestV2: searchReturnMaterialsRequestV2!) {
        searchReturnMaterialsV2(request: \$searchReturnMaterialsRequestV2) {
          materialBasicInformation {
            ...materialBasicInformation
          }
          materials {
            ...MaterialsFields
          }
        }
      } 
    ''';
  }

  String searchReturnMaterialsForSalesRep(bool enableMarketplace) {
    return '''
      fragment MaterialsFields on returnMaterialInformation {
        item {
          assignmentNumber
          referenceDocument
          purchaseNumberC
          poMethod
          createdDate
          currency
          plant
          material
          materialDescription
          DefaultMaterialDescription
          itemNumber
          targetQuantity
          storeLocation
          batch
          highLevelItemCode
          orderReason
          priceDate
          unitPrice
          totalPrice
          principalCode
          principalName
          expiryDate
          eligibleForReturn
          ${enableMarketplace ? 'isMarketPlace' : ''}
          schedules {
            scheduledLine
            requestDate
          }
          conditions {
            conditionType
            conditionValue
          }
          texts {
            textID
            textLine
            language
          }
          suggestedPriceOverride
          balanceQuantity
          balanceValue
          outsidePolicy
          wareHouseStorageCondition
          bonusItem {
            assignmentNumber
            referenceDocument
            purchaseNumberC
            poMethod
            createdDate
            currency
            plant
            material
            materialDescription
            itemNumber
            targetQuantity
            storeLocation
            batch
            highLevelItemCode
            orderReason
            priceDate
            unitPrice
            totalPrice
            principalCode
            principalName
            expiryDate
            eligibleForReturn
            ${enableMarketplace ? 'isMarketPlace' : ''}
            schedules {
              scheduledLine
              requestDate
            }
            conditions {
              conditionType
              conditionValue
            }
            texts {
              textID
              textLine
              language
            }
            suggestedPriceOverride
            balanceQuantity
            balanceValue
            outsidePolicy
            wareHouseStorageCondition
          }
        }
      }

      fragment materialBasicInformation on materialBasicInfo {
        salesOrg
        partnerRole
        partnerNumber
      }

      query searchReturnMaterialsForSalesRepV2(\$searchReturnMaterialsForSalesRepRequest: searchReturnMaterialsForSalesRepRequestV2!) {
        searchReturnMaterialsForSalesRepV2(
          request: \$searchReturnMaterialsForSalesRepRequest
        ) {
          isSearchComplete
          materialBasicInformation {
            ...materialBasicInformation
          }
          materials {
            ...MaterialsFields
          }
          totalCount
        }
      } 
    ''';
  }

  String addRequest() {
    return '''
    mutation addRequestV2(\$returnInput: returnInput!) {
      addRequestV2(input: \$returnInput) {
        requestID
        messages {
          childRequestID
          message {
            type
            number
            message
          }
        }
      }
    }
  ''';
  }
}
