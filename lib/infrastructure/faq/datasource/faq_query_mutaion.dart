class FAQInfoQueryMutation {
  String getFAQInfoQuery() {
    return '''
query (\$pageSize: Int!, \$template: String!, \$path: String!, \$lang: String!, \$after: String) {
  search(
    where: {AND: [{name: "_templates", value: \$template, operator: CONTAINS}, {name: "_path", value: \$path, operator: CONTAINS}, {name: "_language", value: \$lang, operator: CONTAINS}]}
    first: \$pageSize
    after: \$after
  ) {
    pageInfo {
      endCursor
      hasNext

    }
    total
    results {
      ...itemDetailFAQ

    }
  }
}

fragment itemDetailFAQ on Item {
  ... on FAQ {
    id
    name
    question: field(name: "Question") {
      ...textFieldsFAQ

    }
    answer: field(name: "Answer") {
      ...textFieldsFAQ

    }
    category: parent {
      id
      name
      displayName

    }
  }
}

fragment textFieldsFAQ on TextField {
  value
}
 ''';
  }
}
