import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddController extends GetxController {
  final Rx<File?> _image = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Rx<File?> get image => _image;

  Future<void> pickImage() async {
    Rxn<XFile> pickedFile = Rxn<XFile>();
    pickedFile.value = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile.value != null) {
      _image.value = File(pickedFile.value!.path);
    }
  }

  void clearImage() {
    _image.value = null;
  }
}
