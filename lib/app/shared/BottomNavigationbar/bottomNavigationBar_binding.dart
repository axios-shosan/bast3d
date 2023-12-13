import 'package:get/get.dart';

import 'bottomNavigationBar_controller.dart';

class BottomNavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(
            () => BottomNavigationBarController());
  }
}