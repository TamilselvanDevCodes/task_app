import 'package:image_picker/image_picker.dart';

final _ImagePickerService imagePickerService = _ImagePickerService();
int _imageQuality = 100;

class _ImagePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> selectFromGallery() async {
    XFile? file = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: _imageQuality,
    );
    return file;
  }

  Future<List<XFile>> selectMultipleImages() async {
    List<XFile> files = await _imagePicker.pickMultiImage(
      limit: 5,
      imageQuality: _imageQuality,
    );
    return files;
  }

  Future<XFile?> selectVideo({required ImageSource source}) async {
    XFile? file = await _imagePicker.pickVideo(
      source: source,
      maxDuration: const Duration(seconds: 120),
    );
    return file;
  }
}
