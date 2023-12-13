import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomNavigationBar_controller.dart';


class CustomBottomNavigationView extends GetView<BottomNavigationBarController> {

  const CustomBottomNavigationView({Key? key, this.index=0}) : super(key: key);
  final int index;


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<BottomNavigationBarController>(()=>BottomNavigationBarController());

    controller.switchTab(index);

    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );


  }

  Widget _buildWidget() {
    return Container(
      decoration: const BoxDecoration(
          boxShadow : [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
              offset: Offset(0,0),
              blurRadius: 10
            ),
          ],
      ),
      padding: const EdgeInsets.only(bottom: 10.0),
      child: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          _buildNavigationItem("Network", const Icon(Icons.network_cell)),
          _buildNavigationItem("Gallery", const Icon(Icons.photo_outlined)),
          _buildNavigationItem("Camera", const Icon(Icons.camera_alt_outlined)),
          _buildNavigationItem("Guide", const Icon(Icons.book_outlined)),
          _buildNavigationItem("AR", const Icon(Icons.diamond_outlined)),
        ],
        onTap: (index)=>controller.switchTab(index),
        currentIndex: controller.selectedIndex,
        elevation: 0,
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationItem(String label, Icon icon) {
    return BottomNavigationBarItem(
        icon: Padding(padding: const EdgeInsets.only(bottom:5.0),
            child: icon,
          ),
        label: label
    );
  }
}
