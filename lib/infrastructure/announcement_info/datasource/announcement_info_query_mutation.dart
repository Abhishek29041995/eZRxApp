class AnnouncementInfoQueryMutation {
  String getAnnouncementInfoQuery() {
    return r'''
      query (
        $pageSize: Int!
        $template: String!
        $vntemplate: String!
        $path: String!
        $lang: String!
        $after: String
      ) {
        search(
          where: {
            AND: [
              {
                OR: [
                  { name: "_templates", value: $template, operator: CONTAINS },
                  { name: "_templates", value: $vntemplate, operator: CONTAINS }
                ]
              },
              { name: "_path", value: $path, operator: CONTAINS },
              { name: "_language", value: $lang, operator: CONTAINS }
            ]
          },
          first: $pageSize,
          after: $after,
          orderBy: { name: "Release Date", direction: DESC }
        ) {
          pageInfo {
            endCursor
            hasNext
          }
          total
          results {
            ...itemDetail
          }
        }
      }
      
      fragment itemDetail on Item {
        id
        title: field(name: "Title") {
          ...textFields
        }
        content: field(name: "Content") {
          ...richTextFields
        }
        summary: field(name: "Summary") {
          ...textFields
        }
        thumbnail: field(name: "Thumbnail") {
          ...imageFields
        }
        publishedDate: field(name: "Published Date") {
          ...dateFields
        }
        releaseDate: field(name: "Release Date") {
          ...dateFields
        }
        documents: field(name: "Documents") {
          ...multilistFields
        }
        manufacturer: field(name: "Manufacturer") {
          ...textFields
        }
        source: field(name: "Source") {
          ...textFields
        }
        tag: field(name: "Tag") {
          ...lookupFields
        }
        pinToTop: field(name: "Pin To Top") {
          ...checkboxFields
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
      
      fragment textFields on TextField {
        value
      }
      
      fragment checkboxFields on CheckboxField {
        boolValue
      }
      
      fragment richTextFields on RichTextField {
        value
      }
      
      fragment dateFields on DateField {
        isoValue: value
        formattedDateValue: formattedDateValue
      }
      
      fragment imageFields on ImageField {
        src
      }
      
      fragment multilistFields on MultilistField {
        jsonValue
      }
      
      fragment lookupFields on LookupField {
        value: targetItem {
          id
          name
          displayName
        }
      }
''';
  }

  String getAnnouncementInfoDetailsQuery() {
    return r'''
      query ($itemId: String!, $lang: String!) {
        item(path: $itemId, language: $lang) {
          ...itemDetail
        }
      }
      
      fragment itemDetail on Item {
        id
        title: field(name: "Title") {
          ...textFields
        }
        content: field(name: "Content") {
          ...richTextFields
        }
        summary: field(name: "Summary") {
          ...textFields
        }
        thumbnail: field(name: "Thumbnail") {
          ...imageFields
        }
        publishedDate: field(name: "Published Date") {
          ...dateFields
        }
        releaseDate: field(name: "Release Date") {
          ...dateFields
        }
        documents: field(name: "Documents") {
          ...multilistFields
        }
        manufacturer: field(name: "Manufacturer") {
          ...textFields
        }
        source: field(name: "Source") {
          ...textFields
        }
        tag: field(name: "Tag") {
          ...lookupFields
        }
        pinToTop: field(name: "Pin To Top") {
          ...checkboxFields
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
      
      fragment textFields on TextField {
        value
      }
      
      fragment checkboxFields on CheckboxField {
        boolValue
      }
      
      fragment richTextFields on RichTextField {
        value
      }
      
      fragment dateFields on DateField {
        isoValue: value
        formattedDateValue: formattedDateValue
      }
      
      fragment imageFields on ImageField {
        src
      }
      
      fragment multilistFields on MultilistField {
        jsonValue
      }
      
      fragment lookupFields on LookupField {
        value: targetItem {
          id
          name
          displayName
        }
      }
''';
  }
}
