import '../../../domain/entities/step.dart';

class StepDto {
  final int total;

  const StepDto({required this.total});

  factory StepDto.fromJson(Map<String, dynamic> json) {
    return StepDto(
      total: json['total'],
    );
  }

  Step toDomain() {
    return Step(
      total: total,
    );
  }
}
