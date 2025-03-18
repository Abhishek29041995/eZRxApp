
import '../returns_filter_robot.dart';

class ReturnsByRequestFilterRobot extends ReturnsFilterRobot {
  ReturnsByRequestFilterRobot(super.tester);

  @override
  final List<String> statusFilterOptions = [
    'Pending Review',
    'Reviewed',
    'Failed',
  ];
}
