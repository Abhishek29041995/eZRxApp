class AboutUsQueryMutation {
  String getAboutUsQuery() {
    return '''
        query(\$itemId: String!, \$lang: String!) {
  item(path: \$itemId, language: \$lang) {
    ...itemDetail
  }
}
#About Us
fragment itemDetail on Item {
  components: field(name: "Components") {
    ...componentsField
  }
  saleOrgDictionary: field(name: "Sale Org Dictionary") {
    ... on MultilistField {
      value: targetItems {
        key: field(name: "Key") {
          value
        }
        valueForPhytoSaleOrg: field(name: "Value for Phyto sale org") {
          value
        }
        valueForMetroSaleOrg: field(name: "Value for Metro sale org") {
          value
        }
        valueForSangSaleOrg: field(name: "Value for Sang sale org") {
          value
        }
      }
    }
  }
}

fragment componentsField on MultilistField {
  value: targetItems {
    id
    name
    template {
      name
    }
    ...mediaListDetail
    ...sliderDetail
    ...contentSplitDetail
    ...horizontalListDetail
    ...bannerDetail
  }
}

#Banner
fragment bannerDetail on Item {
  ... on Banner {
    media: field(name: "Media") {
      ...imageFields
    }
    title: field(name: "Title") {
      ...textFields
    }
    content: field(name: "Content") {
      ...textFields
    }
    buttonName {
      value
    }
    buttonUrl {
      jsonValue
    }
    backgroundColor {
      value
    }
    backgroundImage {
      ...imageFields
    }
  }
}

#Media List
fragment mediaListDetail on Item {
  ... on MediaList {
    title: field(name: "Title") {
      ...textFields
    }
    description: field(name: "Description") {
      ...textFields
    }
    maxNumberOfItem: field(name: "Max number of item") {
      ...intField
    }
    mediaItems: field(name: "Media") {
      ...multiMediaFields
    }
    buttonName {
      value
    }
    buttonUrl {
      jsonValue
    }
  }
}
fragment multiMediaFields on MultilistField {
  value: targetItems {
    id
    name
    url {
      value: url
    }
  }
}

#Horizontal List
fragment horizontalListDetail on Item {
  ... on HorizontalList {
    title: field(name: "Title") {
      ...textFields
    }
    description: field(name: "Description") {
      ...textFields
    }
    maxNumberOfItem: field(name: "Max number of item") {
      ...intField
    }
    list: field(name: "List") {
      ...horizontalListFields
    }
  }
}

fragment horizontalListFields on MultilistField {
  value: targetItems {
    id
    name
    ...horizontalListSubItemDetail
  }
}

fragment horizontalListSubItemDetail on Item {
  ... on HorizontalListSubItem {
    title: field(name: "Title") {
      ...textFields
    }
    subTitle: field(name: "Sub Title") {
      ...textFields
    }
    description: field(name: "Description") {
      ...textFields
    }
  }
}

#Content Split
fragment contentSplitDetail on Item {
  ... on ContentSplit {
    media: field(name: "Media") {
      ...imageFields
    }
    title: field(name: "Title") {
      ...textFields
    }
    subTitle: field(name: "Sub Title") {
      ...textFields
    }
    description: field(name: "Description") {
      ...richtextFields
    }
    buttonName {
      value
    }
    buttonUrl {
      jsonValue
    }
    greyBackgroundColor {
      boolValue
    }
  }
}

#Slider
fragment sliderDetail on Item {
  ... on Slider {
    title: field(name: "Title") {
      ...textFields
    }
    maxNumberOfItem: field(name: "Max number of item") {
      ...intField
    }
    certificates: field(name: "Certificates") {
      ...certificatesField
    }
    subtitle {
      value
    }
  }
}
fragment certificatesField on MultilistField {
  value: targetItems {
    id
    name
    ...certificateDetail
  }
}

fragment certificateDetail on Item {
  ... on Certification {
    certificationType: field(name: "Certification Type") {
      ...textFields
    }
    certificationName: field(name: "Certification Name") {
      ...textFields
    }
    description: field(name: "Description") {
      ...textFields
    }
    certificationYear: field(name: "Certification Year") {
      ...intField
    }
  }
}

#Common Fragments
fragment textFields on TextField {
  value
}
fragment richtextFields on RichTextField {
  value
}
fragment imageFields on ImageField {
  src
  width
  height
  jsonValue
}
fragment intField on IntegerField {
  value
}

    ''';
  }
}
