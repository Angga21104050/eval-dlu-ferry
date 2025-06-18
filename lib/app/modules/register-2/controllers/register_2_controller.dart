import 'package:get/get.dart';

class Register2Controller extends GetxController {
  //TODO: Implement Register2Controller
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
