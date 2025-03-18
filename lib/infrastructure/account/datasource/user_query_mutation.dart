// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class UserQueryMutation {
  // For fetching userdata by user ID
  String getUserQuery(bool enableMarketPlace, bool userIdRequired) {
    return '''
      query userQuery(
        ${userIdRequired ? '\$id: Int!' : ''} 
      ) {
        user(
          ${userIdRequired ? 'id: \$id' : ''} 
        ) {
            id
            username
            email
            provider
            confirmed
            blocked
            preferredLanguage
            role {
              id
              name
              type
              description
            }
            initialLogin
            accessRight {
              Users
              Orders
              Promos
              LoyaltyScheme
              HCPHUB
              Products
              Services
              Analytics
              AdminPOAttachment
            }
            firstName
            lastName
            adName
            isFromAD
            shipToAddr
            shipToAddrTwo
            disable2fa
            lastLogin
            mobileNumber
            countryCode
            acceptTC
            isResetUserPassword
            optIn
            optInTimestamp
            hasPriceOverride
            hasBonusOverride
            disableReturns
            disablePaymentAccess
            disableCreateOrder
            principalOverrideList
            mobileAccess
            totp2fa
            emailNotifications
            mobileNotifications
            passwordLastUpdate
            passwordActionName
            passwordActionTime
            holiday {
              monday
              tuesday
              wednesday
              thursday
              friday
              saturday
              sunday
            }
            conditionGroup
            salesOrganisations
            salesOrganization
            salesOrganizationTwo
            languagePreference
            preferredLanguage
            supportedLanguages {
              language
            }
            userSalesOrganisationList {
              SalesOrg
              CustomerCode
              ShipToCode
            }
            enableOrderType
            disablePaymentNotification
            paymentNotification {
              day
              disabled
            }
            privacyControls {
              enableBrowserCookies
              automatedPersonalisation
              directMarketing
              viaEmails
              viaPushNotification
              viaSMS
            }
            ${enableMarketPlace ? 'acceptMPTC' : ''}
            isPPATriggerMaintained
            selectedOrderType
          }
        }
    ''';
  }

  String getAnnouncementsQuery() {
    return '''
    {
      announcements {
        id
        active
        description
        startTime
        endTime
        type
      }
    }
    ''';
  }
  /* Query for updation of the users's notification preference accordingly for their language preference  */

  String updatePrivacyPolicy() {
    return '''
      mutation updateAcceptanceStatus(\$isAcceptTC: Boolean!) {

        updateAcceptanceStatus(isAcceptTC: \$isAcceptTC)

    }
    ''';
  }

  String updateMarketPlaceTnCAcceptance() {
    return '''
      mutation updateAcceptanceStatus(\$isAcceptMPTC: Int!) {

        updateAcceptanceStatus(isAcceptMPTC: \$isAcceptMPTC)

    }
    ''';
  }

  String updatePrivacyControl() {
    return '''
      mutation updatePrivacyControl(\$input: UpdatePrivacyControlsInput!) {
        updatePrivacyControls(input: \$input) {
          message
        }
      }
    ''';
  }

  String updateSelectedOrderType() => '''
    mutation updateSelectedOrderType(\$orderType: String!) {
      updateSelectedOrderType(orderType: \$orderType)
    }
  ''';
}
