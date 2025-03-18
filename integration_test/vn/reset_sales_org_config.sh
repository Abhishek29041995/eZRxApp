#!/bin/bash
echo -e "\n"
echo "Presetting sales org config for VN."
loginApiResponse=$(curl -s --location 'https://uat-vn.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "vnrootadmin", "password": "St@ysafe01" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReqFor3070=$(curl --location 'https://uat-vn.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '
        {
      "query": "mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) { updateSalesOrgConfig(input: $input) { salesOrgConfig { salesOrgCode ponRequired priceOverride expiryDateDisplay enableBatchNumber currency netPriceOverride enableVat enableZDP5 materialWithoutPrice enableZDP8Override displayOrderDiscount enableIRN enableTaxClassification disableBundles disableProcessingStatus enableCollectiveNumber enableGimmickMaterial hideStockDisplay showPOAttachment disableDeliveryDate enableTaxAtTotalLevelOnly enableGreenDelivery greenDeliveryDelayInDays greenDeliveryUserRole minOrderAmount hideCustomer disableOrderType vatValue enableSpecialInstructions enableReferenceNote enableMobileNumber enablePaymentTerms enableGMC enableListPrice enableDefaultMD disablePaymentTermsDisplay enableBillTo enableOHPrice addOosMaterials oosValue enableRemarks enableTaxDisplay enableGMN } } } ",
      "variables": {
        "input": {
          "id": 6,
          "data": {
            "ponRequired": false,
            "enableSmallOrderFee": false,
            "smallOrderFeeUserRoles": [],
            "priceOverride": true,
            "expiryDateDisplay": false,
            "batchNumDisplay": false,
            "currency": "vnd",
            "enableUploadAd": false,
            "topLeftAd": "",
            "topRightAd": "",
            "btmLeftAd": "",
            "btmRightAd": "",
            "supportURL": "",
            "minOrderAmount": "1000000",
            "smallOrderFee": 0,
            "vatValue": 0,
            "enableFutureDeliveryDay": false,
            "netPriceOverride": false,
            "futureDeliveryDay": "10",
            "plantNumber": "",
            "materialWithoutPrice": true,
            "enablePaymentTerms": false,
            "enableAnalytics": true,
            "enablePartialPayment": false,
            "enableUnreferencedReturn": false,
            "disableReturnsAccess": false,
            "disablePayment": false,
            "disableReturnsAccessSR": false,
            "enableMobileNumber": false,
            "enableRemarks": false,
            "enableListPrice": true,
            "enableTaxDisplay": false,
            "addOosMaterials": true,
            "oosValue": 1,
            "enableDefaultMD": false,
            "enableZDP5": true,
            "enableZDP8Override": false,
            "enableGMC": false,
            "enableGMN": false,
            "enableBatchNumber": false,
            "enableOHPrice": true,
            "enableSpecialInstructions": true,
            "enableReferenceNote": false,
            "displayOrderDiscount": true,
            "enableIRN": false,
            "enableTaxClassification": false,
            "enableTaxAtTotalLevelOnly": false,
            "displayItemTaxBreakdown": true,
            "displaySubtotalTaxBreakdown": true,
            "supportMail": "",
            "disablePrincipals": false,
            "principalList": {
              "value": []
            },
            "disableDeals": false,
            "principleDisabledDeals": {
              "value": []
            },
            "enable2FA": false,
            "disableBundles": false,
            "disableProcessingStatus": false,
            "disableOrderType": false,
            "enableCollectiveNumber": false,
            "enableGimmickMaterial": true,
            "enableVat": false,
            "hideCustomer": false,
            "enableBillTo": true,
            "disablePaymentTermsDisplay": false,
            "hideStockDisplay": false,
            "showPOAttachment": false,
            "enablePOAttachmentRequired": false,
            "enableLoyaltyScheme": true,
            "disableOverrideFieldCustomer": false,
            "disableOverrideFieldSR": true,
            "disableOverrideApprovalCustomer": false,
            "disableOverrideApprovalSR": false,
            "disableDeliveryDate": true,
            "allowReturnsOutsidePolicy": false,
            "disableApproverActions": false,
            "disableUserRestrictions": false,
            "hideCredit": false,
            "enableComboDeals": true,
            "authorizedsalesRep": [],
            "comboDealsUserRole": 1,
            "mpMinOrderAmount": "0"
          }
        }
      }
    }
')
updateSalesorgconfigMutationReqFor3050=$(curl --location 'https://uat-vn.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '
        {
      "query": "mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) { updateSalesOrgConfig(input: $input) { salesOrgConfig { salesOrgCode ponRequired priceOverride expiryDateDisplay enableBatchNumber currency netPriceOverride enableVat enableZDP5 materialWithoutPrice enableZDP8Override displayOrderDiscount enableIRN enableTaxClassification disableBundles disableProcessingStatus enableCollectiveNumber enableGimmickMaterial hideStockDisplay showPOAttachment disableDeliveryDate enableTaxAtTotalLevelOnly enableGreenDelivery greenDeliveryDelayInDays greenDeliveryUserRole minOrderAmount hideCustomer disableOrderType vatValue enableSpecialInstructions enableReferenceNote enableMobileNumber enablePaymentTerms enableGMC enableListPrice enableDefaultMD disablePaymentTermsDisplay enableBillTo enableOHPrice addOosMaterials oosValue enableRemarks enableTaxDisplay enableGMN } } } ",
      "variables": {
        "input": {
          "id": 5,
          "data": {
            "ponRequired": false,
            "enableSmallOrderFee": false,
            "smallOrderFeeUserRoles": [],
            "priceOverride": true,
            "expiryDateDisplay": false,
            "batchNumDisplay": false,
            "currency": "vnd",
            "enableUploadAd": false,
            "topLeftAd": "",
            "topRightAd": "",
            "btmLeftAd": "",
            "btmRightAd": "",
            "supportURL": "",
            "minOrderAmount": "1000000",
            "smallOrderFee": 0,
            "vatValue": 0,
            "enableFutureDeliveryDay": false,
            "netPriceOverride": false,
            "futureDeliveryDay": "10",
            "plantNumber": "",
            "materialWithoutPrice": true,
            "enablePaymentTerms": false,
            "enableAnalytics": true,
            "enablePartialPayment": false,
            "enableUnreferencedReturn": false,
            "disableReturnsAccess": false,
            "disablePayment": false,
            "disableReturnsAccessSR": false,
            "enableMobileNumber": false,
            "enableRemarks": false,
            "enableListPrice": true,
            "enableTaxDisplay": false,
            "addOosMaterials": true,
            "oosValue": 1,
            "enableDefaultMD": false,
            "enableZDP5": true,
            "enableZDP8Override": false,
            "enableGMC": false,
            "enableGMN": false,
            "enableBatchNumber": false,
            "enableOHPrice": true,
            "enableSpecialInstructions": true,
            "enableReferenceNote": false,
            "displayOrderDiscount": true,
            "enableIRN": false,
            "enableTaxClassification": false,
            "enableTaxAtTotalLevelOnly": false,
            "displayItemTaxBreakdown": true,
            "displaySubtotalTaxBreakdown": true,
            "supportMail": "",
            "disablePrincipals": false,
            "principalList": {
              "value": []
            },
            "disableDeals": false,
            "principleDisabledDeals": {
              "value": []
            },
            "enable2FA": false,
            "disableBundles": false,
            "disableProcessingStatus": false,
            "disableOrderType": false,
            "enableCollectiveNumber": false,
            "enableGimmickMaterial": true,
            "enableVat": false,
            "hideCustomer": false,
            "enableBillTo": true,
            "disablePaymentTermsDisplay": false,
            "hideStockDisplay": false,
            "showPOAttachment": false,
            "enablePOAttachmentRequired": false,
            "enableLoyaltyScheme": true,
            "disableOverrideFieldCustomer": false,
            "disableOverrideFieldSR": true,
            "disableOverrideApprovalCustomer": false,
            "disableOverrideApprovalSR": false,
            "disableDeliveryDate": true,
            "allowReturnsOutsidePolicy": false,
            "disableApproverActions": false,
            "disableUserRestrictions": false,
            "hideCredit": false,
            "enableComboDeals": true,
            "authorizedsalesRep": [],
            "comboDealsUserRole": 1,
            "mpMinOrderAmount": "0"
          }
        }
      }
    }
')
responseFor3050=$(echo $updateSalesorgconfigMutationReqFor3050)
responseFor3070=$(echo $updateSalesorgconfigMutationReqFor3070)
echo "Response for 3050 is : "  $responseFor3050
echo "Response for 3070 is : "  $responseFor3070
echo "Your VN sales org config has been successfully reset."
echo -e "\n"