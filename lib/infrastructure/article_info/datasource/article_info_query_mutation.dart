class ArticleInfoQueryMutation {
  String getArticleInfoQuery() {
    return '''
    query (\$pageSize: Int!, \$template: String!, \$path: String!, \$lang: String!, \$after: String) {
      search(
        where: {AND: [{name: "_templates", value: \$template, operator: CONTAINS}, {name: "_path", value: \$path, operator: CONTAINS}, {name: "_language", value: \$lang, operator: CONTAINS}]}
        first: \$pageSize
        after: \$after
        orderBy: {name: "Published Date", direction: DESC}
      ) {
        pageInfo {
        endCursor
      }
      total
      results {
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
          ...itemDetail
        }
      }
    }

    fragment itemDetail on Item {
          ... on Article {
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
          }
        }

        fragment textFields on TextField {
          value
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
          value: targetItems {
            url {
              value: url
            }
          }
        }

        fragment lookupFields on LookupField {
          value: targetItem {
            id
            name
            displayName
          }
        }

        fragment checkboxFields on CheckboxField {
          isChecked: boolValue
        }
    ''';
  }

  String getArticleInfoQueryIdMarket() {
    return '''
    query (\$pageSize: Int!, \$template1: String!, \$template2: String!, \$path: String!, \$lang: String!, \$after: String) {
      search(
        where: {AND: [{OR: [{name: "_templates", value: \$template1, operator: CONTAINS}, {name: "_templates", value: \$template2, operator: CONTAINS}]}, {name: "_path", value: \$path, operator: CONTAINS}, {name: "_language", value: \$lang, operator: CONTAINS}]}
        first: \$pageSize
        after: \$after
        orderBy: {name: "Release Date", direction: DESC}
      ) {
        pageInfo {
          endCursor
          hasNext
        }
        total
        results {
          ...idArticleWithQuizDetail
          ...idArticleDetail
        }
      }
    }

    fragment idArticleWithQuizDetail on Item {
      ... on IDArticleWithQuiz {
        id
        template {
          name
        }
        title: field(name: "Title") {
          ...textFields
        }
        content: field(name: "Content") {
          ...richTextFields
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
        branch: field(name: "Branch") {
          ...branchField
        }
        iC4: field(name: "IC4") {
          ...ic4Field
        }
        quiz: field(name: "Quiz") {
          ...questionField
        }
        creditTag: field(name: "Credit Tag") {
          ...numberFields
        }
        quizPassRate: field(name: "Quiz Pass Rate") {
          ...numberFields
        }
      }
    }

    fragment idArticleDetail on Item {
      ... on IDArticle {
        id
        template {
          name
        }
        title: field(name: "Title") {
          ...textFields
        }
        content: field(name: "Content") {
          ...richTextFields
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
        branch: field(name: "Branch") {
          ...branchField
        }
        iC4: field(name: "IC4") {
          ...ic4Field
        }
      }
    }

    fragment questionField on MultilistField {
      value: targetItems {
        id
        name
        displayName
        ...question
      }
    }

    fragment branchField on MultilistField {
      value: targetItems {
        id
        name
        displayName
        ...branch
      }
    }

    fragment branch on Item {
      ... on APLBranch {
        branchCode: field(name: "Branch Code") {
          ...textFields
        }
        branchName: field(name: "Branch Name") {
          ...textFields
        }
      }
    }

    fragment ic4Field on MultilistField {
      value: targetItems {
        id
        name
        displayName
        ...ic4
      }
    }

    fragment ic4 on Item {
      ... on APLIC4 {
        code: field(name: "Code") {
          ...textFields
        }
        description: field(name: "Description") {
          ...textFields
        }
      }
    }

    fragment question on Item {
      ... on Questions {
        question: field(name: "Question") {
          ...textFields
        }
        answers: field(name: "Answers") {
          ...textFields
        }
        correctAnswer: field(name: "Correct Answer") {
          ...textFields
        }
      }
    }

    fragment textFields on TextField {
      value
    }

    fragment numberFields on NumberField {
      numberValue
    }

    fragment richTextFields on RichTextField {
      value
    }

    fragment dateFields on DateField {
      isoValue: value
      formattedDateValue: formattedDateValue
    }

    fragment imageFields on ImageField {
      jsonValue
    }

    fragment multilistFields on MultilistField {
      value: targetItems {
        url {
          value: url
        }
      }
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
