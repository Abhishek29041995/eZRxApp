class OrderStatusTrackerQuery {
  String getOrderStatusTracker() {
    return '''
            query ZyllemV2(\$inv: String!, \$sortByUpdateTimeStamp: SORT_ORDER!) {
              zyllemStatusV2(
                invoiceNumber: \$inv
                sortByUpdateTimeStamp: \$sortByUpdateTimeStamp
              ) {
                Entry {
                  Actiom
                  StepName
                  StepStape
                  State
                  Status
                  UpdateTimeStamp
                  PreformedAt
                }
              }
            }
            ''';
  }
}
