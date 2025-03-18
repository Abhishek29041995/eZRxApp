class SalesRepQueryMutation {
  // For fetching Sales Representative by userName
  String getSalesRepInfo() {
    return '''
      query salesRepresentativeInfo(\$userName: String!) {
	        salesRepresentativeInfo(username: \$userName) {
		        rawMetaData {
			        count
			        uniquePrincipalGroup
			        uniquePrincipalNumber
			        uniqueSalesOrganisation
		        }
	        }
      }
    ''';
  }
}
