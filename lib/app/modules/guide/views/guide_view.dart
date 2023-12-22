import 'package:bast3d/app/shared/BottomNavigationbar/bottomNavigationBar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../controllers/guide_controller.dart';

class GuideView extends GetView<GuideController> {
  const GuideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guide'),
        centerTitle: true,
      ),
      body: const ModelViewer(
        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: 'assets/bastion23.glb',
        alt: 'A 3D model of an astronaut',
        ar: true,
        autoRotate: true,
        iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
        disableZoom: false,
      ),
      bottomNavigationBar: const CustomBottomNavigationView(index: 3),
    );
  }
}
