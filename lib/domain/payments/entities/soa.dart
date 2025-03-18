import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_group.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa.freezed.dart';

@freezed
class Soa with _$Soa {
  factory Soa({
    required SoaData soaData,
  }) = _Soa;
  factory Soa.empty() => Soa(
        soaData: SoaData(''),
      );
}

extension SoaListExtension on List<Soa> {
  List<Soa> get getSoaListRespectMonth {
    final soaGroups =
        groupListsBy((item) => item.soaData.date.month).entries.map((entry) {
      final dateSortedSoaList = entry.value
        ..sort(
          (a, b) => b.soaData.date.compareTo(a.soaData.date),
        );

      return SoaGroup(
        createdDate: entry.key,
        soaList: dateSortedSoaList,
      );
    }).toList();

    return soaGroups.map((e) => e.soaList.first).toList();
  }
}
