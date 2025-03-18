class ExecutionDto {
  final String projectKey;
  final String statusName;
  final String testCaseKey;
  final String testCycleKey;
  final int stepCount;

  ExecutionDto({
    required this.projectKey,
    required this.statusName,
    required this.testCaseKey,
    required this.testCycleKey,
    required this.stepCount,
  });

  Map<String, dynamic> toJson() => {
        'projectKey': projectKey,
        'statusName': statusName,
        'testCaseKey': testCaseKey,
        'testCycleKey': testCycleKey,
        'testScriptResults': _generateListOfItems(stepCount, statusName),
        'actualEndDate': DateTime.now().toUtc().toIso8601String(),
        'executionTime': 120000,
        'comment': 'This result was updated automatically!',
      };
}

List<Map<String, dynamic>> _generateListOfItems(int length, String statusName) {
  return List.generate(length, (index) {
    return {
      'statusName': statusName,
    };
  });
}
