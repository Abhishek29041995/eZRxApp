import 'package:cunning_document_scanner/cunning_document_scanner.dart';

class TakePictureService {
  Future<List<String>> takePicture() async =>
      await CunningDocumentScanner.getPictures(isGalleryImportAllowed: true) ??
      <String>[];
}
