class AccountSummaryQuery {
  String getOutstandingBalanceQuery() {
    return '''
    query outstandingBalance(\$request: outstandingBalanceRequest!) {
      outstandingBalance(request: \$request) {
        results {
          customerCode
          currency
          amount
          overdue
          checkDate
        }
      }
    }
    ''';
  }

  String getCreditLimitQuery() {
    return '''
    query creditLimit(\$request: creditLimitRequest!) {
      creditLimit(request: \$request) {
        results {
          partner
          currency
          creditLimit
          creditExposure
          creditBalance
        }
      }
    }
    ''';
  }
}
