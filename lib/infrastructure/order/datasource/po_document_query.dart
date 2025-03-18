class PoDocumentQuery {
  String deleteFile() {
    return '''
   mutation DeleteFile(\$filePath: String!) {
      deleteFile(file: \$filePath) {
        isDeleted
      }
    }
  ''';
  }
}
