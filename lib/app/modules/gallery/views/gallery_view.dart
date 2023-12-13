import 'package:bast3d/app/shared/BottomNavigationbar/bottomNavigationBar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gallery_controller.dart';

class GalleryView extends GetView<GalleryController> {
  const GalleryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(crossAxisCount: 4,
          children: List.generate(100, (index) {
            return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      width: 110.0, height: 110.0),
                )
            );
          }),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationView(index: 1),
    );
  }
}
