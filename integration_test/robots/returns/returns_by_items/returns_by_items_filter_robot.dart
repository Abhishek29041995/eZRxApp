
import '../returns_filter_robot.dart';

class ReturnsByItemsFilterRobot extends ReturnsFilterRobot {
  ReturnsByItemsFilterRobot(super.tester);

  @override
  final List<String> statusFilterOptions = [
    'Pending Approval',
    'Approved',
    'Rejected',
  ];
}
