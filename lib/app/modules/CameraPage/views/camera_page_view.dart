import 'package:bast3d/app/shared/BottomNavigationbar/bottomNavigationBar_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/camera_page_controller.dart';

class CameraPageView extends GetView<CameraPageController> {
  const CameraPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: controller.initializeCamera(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(controller.cameraController),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Obx(() {
                        return Icon(controller.isRecording.value
                            ? Icons.stop
                            : Icons.fiber_manual_record,
                            color: Colors.white,
                        );
                      }),
                      onPressed: () {
                        controller.takePicture();
                      },
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationView(index: 2),
    );
  }
}
