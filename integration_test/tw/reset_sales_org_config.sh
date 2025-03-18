#!/bin/bash
echo -e "\n"
echo "Presetting sales org config for TW."
loginApiResponse=$(curl -s --location 'https://uat-tw.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "twrootadmin", "password": "St@ysafe01" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReq=$(curl --location 'https://uat-tw.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '{ 
    "query": "mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) { updateSalesOrgConfig(input: $input) { salesOrgConfig { salesOrgCode ponRequired priceOverride expiryDateDisplay enableBatchNumber currency netPriceOverride enableVat enableZDP5 materialWithoutPrice enableZDP8Override displayOrderDiscount enableIRN enableTaxClassification disableBundles disableProcessingStatus enableCollectiveNumber enableGimmickMaterial hideStockDisplay showPOAttachment disableDeliveryDate enableTaxAtTotalLevelOnly enableGreenDelivery greenDeliveryDelayInDays greenDeliveryUserRole minOrderAmount hideCustomer disableOrderType vatValue enableSpecialInstructions enableReferenceNote enableMobileNumber enablePaymentTerms enableGMC enableListPrice enableDefaultMD disablePaymentTermsDisplay enableBillTo enableOHPrice addOosMaterials oosValue enableRemarks enableTaxDisplay enableGMN } } } ", 
    "variables": { 
        "input": {
            "id": 1, 
            "data": { 
                "ponRequired": false, 
                "priceOverride": false, 
                "expiryDateDisplay": false, 
                "batchNumDisplay": false, 
                "currency": "twd", 
                "enableUploadAd": false, 
                "topLeftAd": "", 
                "topRightAd": "", 
                "btmLeftAd": "", 
                "btmRightAd": "", 
                "supportURL": "", 
                "minOrderAmount": "0", 
                "vatValue": 0, 
                "enableFutureDeliveryDay": false, 
                "netPriceOverride": false, 
                "futureDeliveryDay": "7", 
                "plantNumber": "", 
                "materialWithoutPrice": true, 
                "enablePaymentTerms": true, 
                "enableAnalytics": false, 
                "enablePartialPayment": false, 
                "enableUnreferencedReturn": false, 
                "disableReturnsAccess": true, 
                "disablePayment": true, 
                "disableReturnsAccessSR": true, 
                "enableMobileNumber": true, 
                "enableRemarks": false, 
                "enableListPrice": true, 
                "enableTaxDisplay": true, 
                "addOosMaterials": true, 
                "oosValue": 1, 
                "enableDefaultMD": true, 
                "enableZDP5": false, 
                "enableZDP8Override": false, 
                "enableGMC": true, 
                "enableGMN": false, 
                "enableBatchNumber": false, 
                "enableOHPrice": true, 
                "enableSpecialInstructions": true, 
                "enableReferenceNote": false, 
                "displayOrderDiscount": true, 
                "enableIRN": false, 
                "enableTaxClassification": false, 
                "enableTaxAtTotalLevelOnly": false, 
                "displayItemTaxBreakdown": false, 
                "displaySubtotalTaxBreakdown": false, 
                "supportMail": "", 
                "disablePrincipals": false, 
                "principalList": {   "value": [] }, 
                "disableDeals": false, 
                "principleDisabledDeals": {   "value": [] }, 
                "enable2FA": false, 
                "disableBundles": false, 
                "disableProcessingStatus": false, 
                "disableOrderType": true, 
                "enableCollectiveNumber": false, 
                "enableGimmickMaterial": true, 
                "enableVat": false, 
                "hideCustomer": true, 
                "enableBillTo": false, 
                "disablePaymentTermsDisplay": false, 
                "hideStockDisplay": true, 
                "showPOAttachment": false, 
                "enablePOAttachmentRequired": false, 
                "enableLoyaltyScheme": false, 
                "disableOverrideFieldCustomer": false, 
                "disableOverrideFieldSR": false, 
                "disableOverrideApprovalCustomer": false, 
                "disableOverrideApprovalSR": false, 
                "disableDeliveryDate": true, 
                "allowReturnsOutsidePolicy": false, 
                "disableApproverActions": false, 
                "disableUserRestrictions": false, 
                "hideCredit": false, 
                "enableComboDeals": false, 
                "comboDealsUserRole": null 
            } 
        } 
    } 
}')
response=$(echo $updateSalesorgconfigMutationReq)
echo "Response is : "  $response
echo "Your TW sales org config has been successfully reset."
echo -e "\n"