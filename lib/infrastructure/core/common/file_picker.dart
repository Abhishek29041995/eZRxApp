import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<FilePickerResult?> pickFiles({
    bool allowMultiple = true,
    FileType fileType = FileType.image,
    List<String>? allowedExtensions,
  }) async {
    return await FilePicker.platform.pickFiles(
      allowMultiple: allowMultiple,
      type: fileType,
      allowedExtensions: allowedExtensions,
    );
  }
}
