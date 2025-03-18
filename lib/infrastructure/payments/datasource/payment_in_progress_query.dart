class PaymentInProgressQuery {
  String getPaymentInProgress() {
    return '''
    query paymentInProgress(\$request: paymentInProgressRequest!) {
      paymentInProgress(request: \$request) {
        results {
          amount
        }
      }
    }
    ''';
  }
}
