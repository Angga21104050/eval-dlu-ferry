import 'package:get/get.dart';

import '../controllers/register_2_controller.dart';

class Register2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Register2Controller>(
      () => Register2Controller(),
    );
  }
}
