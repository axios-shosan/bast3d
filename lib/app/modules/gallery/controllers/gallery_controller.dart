import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GalleryController extends GetxController {
  //TODO: Implement GalleryController

  final count = 0.obs;
  var imageList = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await pickImages();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await pickImages();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> pickImages() async {
    List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages != null) {
      imageList.value.addAll(pickedImages.map((XFile image) => File(image.path)));
    }
  }
}
