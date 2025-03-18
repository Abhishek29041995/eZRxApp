class FavouriteMutation {
  String addFavouriteMutation() {
    return '''
      mutation addFavouriteMaterial(\$materialNumber: String!){
        addFavouriteMaterial(materialNumber:\$materialNumber)
      }
    ''';
  }

  String removeFavouriteMutation() {
    return '''
      mutation removeFavouriteMaterial(\$materialNumber: String!){
        removeFavouriteMaterial(materialNumber:\$materialNumber)
      }
    ''';
  }

  String favouriteStatusQuery() {
    return '''
        query materialDetails(\$materialNumber: String!, \$language: String) {
          materialDetails(materialNumber: \$materialNumber, language: \$language) {
            materialNumber
            isFavourite
          }
        }
      ''';
  }
}
