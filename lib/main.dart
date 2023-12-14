import 'package:bast3d/app/modules/CameraPage/controllers/camera_page_controller.dart';
import 'package:bast3d/core/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CameraPageController());

  runApp(
    GetMaterialApp(
      title: "bast-3D",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      enableLog: true,
    ),
  );
}
