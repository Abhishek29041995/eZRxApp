class AnnouncementArticleTagQueryMutation {
  String getAnnouncementArticleTagQuery() {
    return '''
     query (\$pageSize: Int!, \$template: String!, \$path: String!, \$lang: String!, \$after: String) {
        search(
            where: {
                AND: [
                    { name: "_templates", value: \$template, operator: CONTAINS }
                    { name: "_path", value: \$path, operator: CONTAINS }
                    { name: "_language", value: \$lang, operator: CONTAINS }
                ]
            }
            first: \$pageSize
            after: \$after
            orderBy: { name: "_name", direction: ASC }
        ) {
            pageInfo {
                endCursor
                hasNext
            }
            total
            results {
                id
                name
                displayName
            }
        }
    }
    ''';
  }
}
