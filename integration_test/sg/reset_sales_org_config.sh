#!/bin/bash
echo -e "\n"
echo "Presetting sales org config for SG."
loginApiResponse=$(curl -s --location 'https://uat-sg.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "sgrootadmin", "password": "St@ysafe01" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReq=$(curl --location 'https://uat-sg.ezrxplus.com/api/license' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '{
    "query": "mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) { updateSalesOrgConfig(input: $input) { salesOrgConfig { salesOrgCode ponRequired priceOverride expiryDateDisplay enableBatchNumber currency netPriceOverride enableVat enableZDP5 materialWithoutPrice enableZDP8Override displayOrderDiscount enableIRN enableTaxClassification disableBundles disableProcessingStatus enableCollectiveNumber enableGimmickMaterial hideStockDisplay showPOAttachment disableDeliveryDate enableTaxAtTotalLevelOnly enableGreenDelivery greenDeliveryDelayInDays greenDeliveryUserRole minOrderAmount hideCustomer disableOrderType vatValue enableSpecialInstructions enableReferenceNote enableMobileNumber enablePaymentTerms enableGMC enableListPrice enableDefaultMD disablePaymentTermsDisplay enableBillTo enableOHPrice addOosMaterials oosValue enableRemarks enableTaxDisplay enableGMN } } } ",
    "variables": {
        "input": {
            "id": 1,
            "data": {
                "ponRequired": false,
                "priceOverride": true,
                "expiryDateDisplay": true,
                "batchNumDisplay": false,
                "currency": "sgd",
                "enableUploadAd": false,
                "topLeftAd": "",
                "topRightAd": "",
                "btmLeftAd": "",
                "btmRightAd": "",
                "supportURL": "",
                "minOrderAmount": "100",
                "vatValue": 9,
                "enableFutureDeliveryDay": false,
                "netPriceOverride": true,
                "futureDeliveryDay": "1",
                "plantNumber": "",
                "materialWithoutPrice": true,
                "enablePaymentTerms": false,
                "enableAnalytics": false,
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
                "enableDefaultMD": true,
                "enableZDP5": false,
                "enableZDP8Override": true,
                "enableGMC": false,
                "enableGMN": false,
                "enableBatchNumber": false,
                "enableOHPrice": true,
                "enableSpecialInstructions": true,
                "enableReferenceNote": false,
                "displayOrderDiscount": false,
                "enableIRN": false,
                "enableTaxClassification": false,
                "enableTaxAtTotalLevelOnly": false,
                "displayItemTaxBreakdown": false,
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
                "enableGimmickMaterial": false,
                "enableVat": false,
                "hideCustomer": true,
                "enableBillTo": false,
                "disablePaymentTermsDisplay": false,
                "hideStockDisplay": false,
                "showPOAttachment": false,
                "enablePOAttachmentRequired": false,
                "enableLoyaltyScheme": false,
                "disableOverrideFieldCustomer": false,
                "disableOverrideFieldSR": false,
                "disableOverrideApprovalCustomer": false,
                "disableOverrideApprovalSR": false,
                "disableDeliveryDate": false,
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
echo "Your SG sales org config has been successfully reset."
echo -e "\n"