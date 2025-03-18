class ComboDealQueryMutation {
  String getComboDealForMaterials() {
    return '''
     query comboDealForMaterials(
      \$customerCode: String!, 
      \$salesOrg: String!, 
      \$salesDeal: String!, 
      \$flexibleGroup: String!, 
      \$validatedMatnrList: [String!]!
      ) {
        comboDealForMaterials(
          salesOrg: \$salesOrg
          customerCode: \$customerCode
          salesDeal: \$salesDeal
          flexibleGroup: \$flexibleGroup
          validatedMatnrList: \$validatedMatnrList
        ) {
          groupDeal {
            minTotalAmount
            maxTotalAmount
            minTotalQuantity
            rate
            type
            conditionNumber
          }
          flexiSKUTier {
            rate
            conditionNumber
            minQty
            type
          }
          flexiQtyTier {
            rate
            type
            conditionNumber
            minQty
            suffix
          }
          flexiAmmountTier {
            conditionNumber
            minTotalAmount
            minTotalCurrency
            maxTotalAmount
            maxTotalCurrency
            rate
            type
          }
          materialComboDeals {
            setNo
            materials {
              minQty
              materialNumber
              rate
              type
              conditionNumber
              mandatory
              suffix
            }
          }
        }
      }
    ''';
  }

  String getComboDealForPrincipleGroup() {
    return '''
      query comboDealForPrincMatGrp(
        \$salesOrg: String!
        \$customerCode: String!
        \$salesDeal: String!
        \$flexibleGroup: String!
      ) {
        comboDealForPrincMatGrp(
          salesOrg: \$salesOrg
          customerCode: \$customerCode
          salesDeal: \$salesDeal
          flexibleGroup: \$flexibleGroup
        ) {
            flexiGroupCombo {
              type      
              value      
              minQty      
              setNo    
            }    
            flexiTierRule {      
              rate      
              type      
              minTotalAmount      
              maxTotalAmount      
              minTotalCurrency      
              maxTotalCurrency      
              minQty      
              conditionNumber      
              conditions    
            }  
          }
       }
    ''';
  }
}
