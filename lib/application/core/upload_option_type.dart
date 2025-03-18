import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

enum UploadOptionType { takePhoto, gallery, file }

extension UploadOptionTypeExt on UploadOptionType {
  String get displayName {
    switch (this) {
      case UploadOptionType.takePhoto:
        return 'Take photo';
      case UploadOptionType.gallery:
        return 'Open gallery';
      case UploadOptionType.file:
        return 'Browse files';
    }
  }

  Widget get icon {
    switch (this) {
      case UploadOptionType.takePhoto:
        return const Icon(
          Icons.camera_alt_outlined,
          color: ZPColors.primary,
        );
      case UploadOptionType.gallery:
        return const Icon(
          Icons.collections_outlined,
          color: ZPColors.primary,
        );
      case UploadOptionType.file:
        return const Icon(
          Icons.tab,
          color: ZPColors.primary,
        );
    }
  }
}
