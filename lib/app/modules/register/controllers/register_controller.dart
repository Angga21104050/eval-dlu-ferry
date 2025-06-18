import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  var gender = 'Laki Laki'.obs;

  void updateGender(String value) {
    gender.value = value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
