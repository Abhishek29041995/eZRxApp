// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class UsageCodeQueryMutation {
  // For fetching Usages data by Sales Org
  String getUsageQuery() {
    return '''
       query (\$salesOrg: String!) {  
       usage(request: {salesOrg: \$salesOrg}) {    
          usageCode    
          usageDescription  
          }
       }
    ''';
  }
}
