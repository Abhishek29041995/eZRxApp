import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_file_buffer.freezed.dart';

@freezed
class AttachmentFileBuffer with _$AttachmentFileBuffer {
  const AttachmentFileBuffer._();
  factory AttachmentFileBuffer({
    required Uint8List buffer,
    required String name,
  }) = _AttachmentFileBuffer;
  factory AttachmentFileBuffer.empty() => AttachmentFileBuffer(
        buffer: Uint8List(0),
        name: '',
      );
}
