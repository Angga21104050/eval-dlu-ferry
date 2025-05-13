import 'package:get/get.dart';

class MyTicketDetailController extends GetxController {
  //TODO: Implement MyTicketDetailController
  RxBool isScrolled = false.obs;

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
