import 'package:bast3d/core/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
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
