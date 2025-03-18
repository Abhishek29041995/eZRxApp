// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class BannerQueryMutation {
  String getEZReachBannerQuery() {
    return '''
      query getLiveCampaigns(\$getLiveCampaignInput: getLiveCampaignInput) {
  getLiveCampaigns(request: \$getLiveCampaignInput) {
    statusCode
    statusMessage
    data {
      bannerId
      bannerCampaignName
      startDate
      bannerCampaignLocations
      bannerUrl
      mobileBannerImg
      endDate
      websiteUrl
      salesOrg
      countryCode
      bannerCountId
      salesRep
      status
      customers
      companyName
      targetProduct
      keyWord
    }
  }
}
    ''';
  }
}
