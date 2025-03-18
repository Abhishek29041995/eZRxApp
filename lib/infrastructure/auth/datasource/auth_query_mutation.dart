// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class AuthQueryMutation {
  // For Loggin in by username and Password
  // Or Loggin in by Okta access token
  // updating the FCM token for notifications using Firebase Cloud Messaging
  String getLoginQuery() {
    return '''
      query (\$input:loginV4Input!){
        loginV4(input:\$input){
          authenticated
          eZRxJWT
          eZRxRefreshJWT
          passwordLastReset
          passwordExpiry
          email
          isAccountLocked
          isAccountExpired
          accountExpiryDate
          supportedLanguages {
            language
            searchFilter
          }
          userMobileToken {
            firstName
            lastName
            mobileTokens {
              token
              dateUpdated
              provider
            }
            mobileNotifications
          }
          user{
            role {
              id
              name
              type
              description
            }
            username
            salesOrganisations
          }
      }
    }
    ''';
  }

  // For Admin Login on behalf
  // By given admin access token + target username to get target access token
  String getProxyLoginQuery() {
    return '''
      query proxyLogin(\$request: ProxyLoginRequestV3!) {
        proxyLoginV3(request: \$request) {
            userID
            authenticated
            eZRxJWT
            email
            userMobileToken {
                firstName
                lastName
                mobileTokens {
                    token
                    dateUpdated
                    provider
                }
                mobileNotifications
            }
            passwordLastReset
            passwordExpiry
            isAccountLocked
            isAccountExpired
        }
    }
    ''';
  }

//   String loginData(String username, String password, String fcmtoken) {
//     return '''{
//       loginV2(
//           username: "$username"
//           password: "$password"
//           includeStrapi: "true"
//           mobileToken: {mobileTokens:[{token:"$fcmtoken",provider:"firebase"}]}
//       ) {
//           user {
//           id
//           role {
//               id
//               name
//               type
//               description
//           }
//           passwordLastUpdate
//           username
//           firstName
//           lastName
//           email
//           isFromAD
//           userSalesOrganisationList{
//             value{
//               customerCode
//               shipToCode
//               salesOrg
//             }
//           }
//           mobileNumber
//           countryCode
//           initialLogin
//           accessRight {
//               Users
//               Orders
//               Promos
//               HCPHUB
//               Products
//               Services
//               Analytics
//           }
//           hasBonusOverride
//           hasPriceOverride
//           acceptTC
//           acceptAUP
//           acceptLocalTC
//           acceptMobileTC
//           mobileAccess
//           disable2fa
//           totp2fa
//           }
//           authenticated
//           eZRxJWT
//           passwordLastReset
//           passwordExpiry
//           email
//           isAccountLocked
//           isAccountExpired
//           accountExpiryDate
//       }
//     }''';
//   }
// }

  String changePassword() {
    return '''
      mutation(\$username: String!, \$oldPassword: String!, \$newPassword : String!){
        changePassword(username: \$username, oldPassword: \$oldPassword, newPassword: \$newPassword){
          success
          status
        }
      }
    ''';
  }

  String getAccessToken() {
    return '''
        query getAccessToken(\$eZRxRefreshToken: String!) {
            getAccessToken(request: {eZRxRefreshToken: \$eZRxRefreshToken}) {
              eZRxAccessToken
              eZRxRefreshToken
              message
              __typename
            }
        }
    ''';
  }

  String requestResetPassword() {
    return '''
        mutation requestResetPasswordLink(\$username: String!) {
            requestResetPassword(username: \$username){
              success
              email
            }
        }
    ''';
  }

  String resetPassword() {
    return '''
        mutation resetPasswordV3(\$newPassword: String!, \$resetPasswordToken: String) {
          resetPasswordV3(
            newPassword: \$newPassword
            resetPasswordToken: \$resetPasswordToken
          ){
            success
            status
          }
        }
    ''';
  }

  String changePasswordForFirstTime() {
    return '''
       mutation (\$newPassword: String!) {
  changePasswordFirstTime(newPassword: \$newPassword) {
    success
    status
  }
}
    ''';
  }

  String validateResetPasswordKey() {
    return '''
      query validateResetPasswordKey(\$key: String!) {
        validateResetPasswordKey(key: \$key) {
          isValid
        }
      }
    ''';
  }
}
