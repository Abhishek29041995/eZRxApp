class ContactUsQuery {
  String getContactUsQuery() {
    return '''
query(\$itemId: String!, \$lang: String!) {
  item(path: \$itemId, language: \$lang) {
    id
    ...itemDetail
  }
}

fragment itemDetail on Item {
  id
  title: field(name: "Title") {
    ...textFields
  }
  backgroundImage: field(name: "Background Image") {
    ...imageFields
  }
  content: field(name: "Content") {
    ...richtextFields
  }
  preloginSendToEmail: field(name: "Prelogin Send To Email") {
    value
  }
  postloginSendToEmail: field(name: "Postlogin Send To Email") {
    value
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
fragment richtextFields on RichTextField {
  value
}
fragment textFields on TextField {
  value
}
fragment imageFields on ImageField {
  jsonValue
}
    ''';
  }
}
