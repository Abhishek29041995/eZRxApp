extension MapExt on Map<String, dynamic> {
  Map<String, dynamic> excludeEmptyString(Map<String, dynamic> filterMap) =>
      this
        ..removeWhere(
          (key, value) => (value is String && value.isEmpty),
        )
        ..addAll(filterMap._excludeEmptyDataOrEmptyDate);

  Map<String, dynamic> get _excludeEmptyDataOrEmptyDate => this
    ..removeWhere(
      (key, value) =>
          ((key == 'dateFrom' || key == 'dateTo') && value == '-') ||
          (value is String && value.isEmpty) ||
          (value is List && value.isEmpty),
    );
}
