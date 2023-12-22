import 'dart:io';

import 'package:bast3d/app/shared/BottomNavigationbar/bottomNavigationBar_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/camera_page_controller.dart';

class TakePictureScreen extends StatefulWidget {
  TakePictureScreen({
    super.key,
  });
  final CameraDescription camera = Get.find<CameraPageController>().cameras[0] ;
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();

    _controller=CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture=_controller.initialize();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('take picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_controller);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          try{
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            if(!mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder:(context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch(e){
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget{
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}

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
