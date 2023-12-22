import 'package:get/get.dart';

import '../modules/CameraPage/bindings/camera_page_binding.dart';
import '../modules/CameraPage/views/camera_page_view.dart';
import '../modules/ar/bindings/ar_binding.dart';
import '../modules/ar/views/ar_view.dart';
import '../modules/gallery/bindings/gallery_binding.dart';
import '../modules/gallery/views/gallery_view.dart';
import '../modules/guide/bindings/guide_binding.dart';
import '../modules/guide/views/guide_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY,
      page: () => const GalleryView(),
      binding: GalleryBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_PAGE,
      page: () =>  TakePictureScreen(),
      binding: CameraPageBinding(),
    ),
    GetPage(
      name: _Paths.AR,
      page: () => const ArView(),
      binding: ArBinding(),
    ),
    GetPage(
      name: _Paths.GUIDE,
      page: () => const GuideView(),
      binding: GuideBinding(),
    ),
  ];
}
