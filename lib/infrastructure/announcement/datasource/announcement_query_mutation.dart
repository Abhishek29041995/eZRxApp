// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class AnnouncementQueryMutation {
  // For fetching userdata by user ID
  String getAnnouncementsQuery() {
    return '''
    {
      getAnnouncements {
        active
        descriptionList {
            language
            languageCode
            announcement
        }
        startTime
        endTime
        type
        day
        functionLabel
        id
        created_at
        updated_at
        isModuleSpecific
        moduleName
        loginType
        isCrossButton
      }
    }
    ''';
  }

  String getMaintenanceBannerQuery() {
    return '''
    query (\$itemId: String!, \$lang: String!) {
  item(path: \$itemId, language: \$lang) {
    ...itemDetail
    __typename
  }
}

fragment itemDetail on Item {
  id
  name
  displayName
  maxNumberOfItem: field(name: "Max number of item") {
    ...numberFields
    __typename
  }
  banners: field(name: "Banners") {
    ...bannersField
    __typename
  }
  __typename
}

fragment bannersField on MultilistField {
  value: targetItems {
    id
    name
    template {
      name
      __typename
    }
    ...bannerDetail
    __typename
  }
  __typename
}

fragment bannerDetail on Item {
  id
  name
  displayName
  content: field(name: "Content") {
    ...richTextFields
    __typename
  }
  publishedDate: field(name: "Published Date") {
    ...dateFields
    __typename
  }
  hyperlink: field(name: "Hyperlink") {
    ...linkFields
    __typename
  }
  type: field(name: "Type") {
    ...textFields
    __typename
  }
  applicableModules: field(name: "Select applicable module") {
    ...multilistFields
    __typename
  }
  enableCrossButton: field(name: "Enable cross button") {
    ...checkboxFields
    __typename
  }
  login: field(name: "Login") {
    ...textFields
    __typename
  }
  saleOrgDictionary: field(name: "Sale Org Dictionary") {
    ... on MultilistField {
      value: targetItems {
        key: field(name: "Key") {
          value
          __typename
        }
        valueForPhytoSaleOrg: field(name: "Value for Phyto sale org") {
          value
          __typename
        }
        valueForMetroSaleOrg: field(name: "Value for Metro sale org") {
          value
          __typename
        }
        valueForSangSaleOrg: field(name: "Value for Sang sale org") {
          value
          __typename
        }
        __typename
      }
      __typename
    }
    __typename
  }
  __typename
}

fragment numberFields on IntegerField {
  intValue
  __typename
}

fragment dateFields on DateField {
  isoValue: value
  formattedDateValue: formattedDateValue
  __typename
}

fragment linkFields on LinkField {
  jsonValue
  __typename
}

fragment richTextFields on RichTextField {
  value
  __typename
}

fragment textFields on TextField {
  value
  __typename
}

fragment multilistFields on MultilistField {
  value: targetItems {
    ... on DropdownListSubItem {
      id
      name
      displayName
      __typename
    }
    __typename
  }
  __typename
}

fragment checkboxFields on CheckboxField {
  value: boolValue
  __typename
}
    ''';
  }
}
