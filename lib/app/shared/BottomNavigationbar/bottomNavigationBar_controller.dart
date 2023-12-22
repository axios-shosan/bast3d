import 'package:get/get.dart';

import '../../routes/app_pages.dart';


enum MainTabs { network, gallery, camera, guide, ar  }

class BottomNavigationBarController extends GetxController {

  final _currentTab = MainTabs.network.obs;
  final _active = false.obs;

  MainTabs get selectedTab => _currentTab.value;

  int get selectedIndex => _currentTab.value.index;

  int get bottomNavSelectedIndex {
    switch(_currentTab.value) {
      case MainTabs.network:
        // TODO: Handle this case.
        return 0;
      case MainTabs.gallery:
        // TODO: Handle this case.
        return 1;
      case MainTabs.camera:
        // TODO: Handle this case.
        return 2;
      case MainTabs.guide:
        // TODO: Handle this case.
        return 3;
      case MainTabs.ar:
        // TODO: Handle this case.
        return 4;
    }
  }

  void switchTab(int index) {
    switch(index) {
      case 0:
        _currentTab.value = MainTabs.network;
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        _currentTab.value = MainTabs.gallery;
        Get.toNamed(Routes.GALLERY);
        break;
      case 2:
        _currentTab.value = MainTabs.camera;
        Get.toNamed(Routes.CAMERA_PAGE);
        break;
      case 3:
        _currentTab.value = MainTabs.guide;
        Get.toNamed(Routes.GUIDE);
      case 4:
        _currentTab.value = MainTabs.ar;
        Get.toNamed(Routes.AR);
        break;
      default:
        _currentTab.value = MainTabs.network;
    }
  }

  void toggleActiveBtn() {
    _active.value = !_active.value;
  }

  bool get isActive => _active.value;

}
