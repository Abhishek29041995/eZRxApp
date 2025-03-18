#!/bin/bash

echo -e "\n"
echo "Presetting sales org config for MY."

endpoint=https://uat-my.ezrxplus.com/api/license

marketplaceUsername=mpmyclientuser
marketplacePassword=St@ysafe01

adminUsername=myrootadmin
adminPassword=St@ysafe01

### Reset Marketplace term and condition acceptance status

loginApiResponse=$(curl -s --location $endpoint \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "'${marketplaceUsername}'", "password": "'$marketplacePassword'" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
curl --location $endpoint \
--header 'Authorization: Bearer v2 '"$response" \
--header 'content-type: application/json; charset=UTF-8' \
--data '{"query":"      mutation updateAcceptanceStatus($isAcceptMPTC: Int!) {\n\n        updateAcceptanceStatus(isAcceptMPTC: $isAcceptMPTC)\n\n    }\n    ","variables":{"isAcceptMPTC":0}}'

### Reset Sales org config

loginApiResponse=$(curl -s --location $endpoint \
--header 'Content-Type: application/json' \
--data '{"variables": { "input": { "username": "'$adminUsername'", "password": "'$adminPassword'" } }, "query": "query LoginV4($input: loginV4Input!) { loginV4(input: $input) { eZRxJWT } }"}')
response=$(echo $loginApiResponse | sed -e 's/^.*"eZRxJWT":"\([^"]*\)".*$/\1/')
updateSalesorgconfigMutationReq=$(curl --location $endpoint \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer v2 '"$response" \
--data '
{
  "query": "mutation updateSalesorgconfigMutation($input: UpdateSalesOrgConfigInput!) {updateSalesOrgConfig(input: $input) {    salesOrgConfig {        salesOrgCode        ponRequired        priceOverride        expiryDateDisplay        enableBatchNumber        currency        netPriceOverride                enableVat        enableZDP5                materialWithoutPrice        enableZDP8Override        displayOrderDiscount        enableIRN        enableTaxClassification        disableBundles        disableProcessingStatus        enableCollectiveNumber        enableGimmickMaterial        hideStockDisplay        showPOAttachment        disableDeliveryDate        enableTaxAtTotalLevelOnly        enableGreenDelivery        greenDeliveryDelayInDays        greenDeliveryUserRole        minOrderAmount        hideCustomer        disableOrderType        vatValue        enableSpecialInstructions        enableReferenceNote        enableMobileNumber        enablePaymentTerms        enableGMC        enableListPrice        enableDefaultMD        disablePaymentTermsDisplay        enableBillTo        enableOHPrice        addOosMaterials        oosValue        enableRemarks        enableTaxDisplay        enableGMN        enableMarketPlace        mpMinOrderAmount        }    }}       ",
  "variables": {
    "input": {
      "id": 4,
      "data": {
        "ponRequired": false,
        "enableSmallOrderFee": false,
        "smallOrderFeeUserRoles": [],
        "priceOverride": true,
        "expiryDateDisplay": true,
        "batchNumDisplay": true,
        "currency": "myr",
        "enableUploadAd": false,
        "topLeftAd": "",
        "topRightAd": "",
        "btmLeftAd": "",
        "btmRightAd": "",
        "supportURL": "",
        "minOrderAmount": "300",
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
        "enableMobileNumber": false,
        "enableRemarks": false,
        "enableListPrice": false,
        "enableTaxDisplay": false,
        "addOosMaterials": true,
        "oosValue": 1,
        "enableDefaultMD": false,
        "enableZDP5": false,
        "enableZDP8Override": false,
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
        "disableOrderType": false,
        "enableCollectiveNumber": true,
        "enableGimmickMaterial": false,
        "enableVat": false,
        "hideCustomer": false,
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
        "statementOfAccountEnabled": true,
        "enableComboDeals": false,
        "authorizedsalesRep": [],
        "comboDealsUserRole": null,
        "enableMarketPlace": true,
        "mpMinOrderAmount": "400"
      }
    }
  }
}
')

response=$(echo $updateSalesorgconfigMutationReq)
echo "Response is : "  $response

echo "Your MY sales org config has been successfully reset."
echo -e "\n"