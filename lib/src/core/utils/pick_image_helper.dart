import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage() async {
  try {
    final ImagePicker picker = ImagePicker();

    // Pick an image from gallery
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800, // Optional: Resize the image to 800px height
      maxWidth: 800, // Optional: Resize the image to 800px width
      imageQuality:
          80, // Optional: Set image quality to 80% to reduce file size
    );

    // Return the picked file or null if not picked
    return pickedFile;
  } catch (e) {
    // Log error if any exception occurs
    return null;
  }
}
