class ClaimManagementQueryMutation {
  String getPrincipalForSalesOrg() {
    return '''
    query principalSalesOrg(\$salesOrg: String!) {
      principalForSalesOrg(request: {salesOrg: \$salesOrg}) {
        principals {
          principalName
          principalCode
        }
      }
    }
    ''';
  }

  String getClaimList() {
    return '''
      query GetClaimList(\$input: ClaimListRequest!) { 
        getClaimList(input: \$input) { 
            createdAt 
            principalCode 
            principalName 
            claimType 
            claimAmount 
            claimId 
        } 
      }
    ''';
  }

  String submitClaim() {
    return '''
    mutation submitClaim(\$input: SubmitClaimRequest!) {
      submitClaim(input: \$input){
        success
        message
      }
    }
    ''';
  }
}
