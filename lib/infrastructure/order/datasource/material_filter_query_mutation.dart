class MaterialFilterQueryMutation {
  String getMaterialFilterCategoryList() {
    return '''
      query (\$request: GetFilterListRequest!) {
        GetFilterList(request: \$request) {
          ManufactureList
          CountryList {
            Code
            Name
          }
          BrandList
        }
      }
    ''';
  }
}
