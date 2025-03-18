class DownloadPaymentAttachmentQuery {
  String getFileUrl() {
    return '''
       query customerDocumentHeaderExcel(\$input: customerDocumentHeaderRequest!) {
          customerDocumentHeaderExcel(request: \$input) {
            url
          }
      }
    ''';
  }

  String getPaymentSummaryFileUrl() {
    return '''
       query customerPaymentExcel(\$request: customerPaymentRequest!) {
        customerPaymentExcel(request: \$request) {
          url
        }
      }
   ''';
  }
}
