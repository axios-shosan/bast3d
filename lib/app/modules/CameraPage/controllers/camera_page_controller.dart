import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraPageController extends GetxController {
  late CameraController _cameraController;
  var isRecording = false.obs;
  late List<CameraDescription> cameras;

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  bool isCameraInitialized() {
    return _cameraController != null;
  }

  Future<void> takePicture() async {
    if(_cameraController == null) {
      return;
    }

    if (! !_cameraController.value.isInitialized || isRecording.value) {
      return;
    }

    try {
      print("takeing a pic");
      final XFile picture = await _cameraController.takePicture();
      // Handle the captured picture (e.g., save it, display it, etc.)
      print('Picture saved: ${picture.path}');
    } catch (e) {
      // Handle picture capture error
      print('Error taking picture: $e');
    }
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);

    await _cameraController.initialize();

    _cameraController.addListener(() {
      update(); // Trigger a rebuild when camera state changes
    });
  }

  void toggleRecording() {
    if (isRecording.value) {
      // Stop recording logic
    } else {
      // Start recording logic
    }
    isRecording.toggle();
  }

  CameraController get cameraController => _cameraController;

  @override
  void onClose() {
    _cameraController.dispose();
    super.onClose();
  }

}
