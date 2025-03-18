class OrderQueryMutation {
  String submitOrder(bool enableMarketPlace) {
    return '''
    mutation submitOrderMutation(\$NewOrderInput: NewOrderInputSecure!) {
      submitOrder(order: \$NewOrderInput) {
        SalesDocument
        ${enableMarketPlace ? 'SalesDocuments' : ''}
        Messages {
          Type
          Message
        }
      }
    }
    ''';
  }
}
