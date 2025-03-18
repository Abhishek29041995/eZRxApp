class EZCSTicketQueryMutation {
  String submitTicket() {
    return '''
  mutation submitEZCSTicket(\$submitInput: SubmitEZCSRequest!) { 
    submitEZCSTicket(input: \$submitInput){ 
        success 
        message 
      }
  }
    ''';
  }
}
