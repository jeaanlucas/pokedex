import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  factory ImagePickerService() => _instance;

  ImagePickerService._privateConstructor();

  static final ImagePickerService _instance =
      ImagePickerService._privateConstructor();

  Future<XFile?> pickImageFromGallery() async {
    ImagePicker picker = ImagePicker();

    return await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
  }
}
