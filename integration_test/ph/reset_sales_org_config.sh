#!/bin/bash
echo -e "\n"
echo "Presetting sales org config for PH."
loginApiResponse=$(curl -s --location 'https://uat-ph.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "phrootadmin", "password": "St@ysafe01" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReq=$(curl --location 'https://uat-ph.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '{
    "query":"mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) { updateSalesOrgConfig(input: $input) { salesOrgConfig { salesOrgCode ponRequired priceOverride expiryDateDisplay enableBatchNumber currency netPriceOverride enableVat enableZDP5 materialWithoutPrice enableZDP8Override displayOrderDiscount enableIRN enableTaxClassification disableBundles disableProcessingStatus enableCollectiveNumber enableGimmickMaterial hideStockDisplay showPOAttachment disableDeliveryDate enableTaxAtTotalLevelOnly enableGreenDelivery greenDeliveryDelayInDays greenDeliveryUserRole minOrderAmount hideCustomer disableOrderType vatValue enableSpecialInstructions enableReferenceNote enableMobileNumber enablePaymentTerms enableGMC enableListPrice enableDefaultMD disablePaymentTermsDisplay enableBillTo enableOHPrice addOosMaterials oosValue enableRemarks enableTaxDisplay enableGMN } } } ", 
    "variables": { 
        "input": {
            "id": 7, 
            "data": {
            "ponRequired": true,
            "enableSmallOrderFee": false,
            "smallOrderFeeUserRoles": [],
            "priceOverride": true,
            "expiryDateDisplay": false,
            "batchNumDisplay": false,
            "currency": "php",
            "enableUploadAd": false,
            "topLeftAd": "",
            "topRightAd": "",
            "btmLeftAd": "",
            "btmRightAd": "",
            "supportURL": "",
            "minOrderAmount": "0",
            "smallOrderFee": 0,
            "vatValue": 0,
            "enableFutureDeliveryDay": false,
            "netPriceOverride": false,
            "futureDeliveryDay": "7",
            "plantNumber": "",
            "materialWithoutPrice": true,
            "enablePaymentTerms": false,
            "enableAnalytics": false,
            "enablePartialPayment": false,
            "enableUnreferencedReturn": false,
            "disableReturnsAccess": false,
            "disablePayment": false,
            "disableReturnsAccessSR": false,
            "enableMobileNumber": true,
            "enableRemarks": false,
            "enableListPrice": true,
            "enableTaxDisplay": false,
            "addOosMaterials": true,
            "oosValue": 1,
            "enableDefaultMD": true,
            "enableZDP5": false,
            "enableZDP8Override": true,
            "enableGMC": false,
            "enableGMN": true,
            "enableBatchNumber": false,
            "enableOHPrice": true,
            "enableSpecialInstructions": true,
            "enableReferenceNote": true,
            "displayOrderDiscount": true,
            "enableIRN": false,
            "enableTaxClassification": false,
            "enableTaxAtTotalLevelOnly": false,
            "displayItemTaxBreakdown": false,
            "displaySubtotalTaxBreakdown": false,
            "supportMail": "",
            "disablePrincipals": true,
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
            "disableOrderType": true,
            "enableCollectiveNumber": false,
            "enableGimmickMaterial": false,
            "enableVat": false,
            "hideCustomer": false,
            "enableBillTo": false,
            "disablePaymentTermsDisplay": true,
            "hideStockDisplay": false,
            "showPOAttachment": false,
            "enablePOAttachmentRequired": false,
            "enableLoyaltyScheme": false,
            "disableOverrideFieldCustomer": true,
            "disableOverrideFieldSR": true,
            "disableOverrideApprovalCustomer": false,
            "disableOverrideApprovalSR": false,
            "disableDeliveryDate": false,
            "allowReturnsOutsidePolicy": true,
            "disableApproverActions": true,
            "disableUserRestrictions": true,
            "hideCredit": false,
            "enableComboDeals": false,
            "authorizedsalesRep": [],
            "comboDealsUserRole": null,
            "mpMinOrderAmount": "0"
            }
        } 
    } 
}')
response=$(echo $updateSalesorgconfigMutationReq)
echo "Response is : "  $response
echo "Your PH sales org config has been successfully reset."
echo -e "\n"