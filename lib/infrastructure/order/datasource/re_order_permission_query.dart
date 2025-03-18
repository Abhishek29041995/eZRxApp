class ReOrderPermissionQuery {
  String getReOrderPermission() {
    return '''
      query validCustomerMaterials(\$request: validCustomerMaterialsRequest!) {
        validCustomerMaterials(request: \$request) {    
          materials{
            hidePrice
            materialNumber
            isGimmick
            isValid
          }
        }
      }
    ''';
  }
}
