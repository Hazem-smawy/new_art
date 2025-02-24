import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerController extends GetxController {
  var selectedFiles = <PlatformFile>[].obs;

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio, // Filter to allow only audio files
      allowMultiple: false, // Allow multiple files to be selected
    );

    if (result != null) {
      selectedFiles.clear();
      selectedFiles.addAll(result.files);
    } else {
      // User canceled the picker
    }
  }

  void clearFiles() {
    selectedFiles.clear();
  }
}
