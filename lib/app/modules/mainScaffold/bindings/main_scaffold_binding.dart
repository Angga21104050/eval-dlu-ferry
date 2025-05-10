import 'package:get/get.dart';

import '../controllers/main_scaffold_controller.dart';

class MainScaffoldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScaffoldController>(
      () => MainScaffoldController(),
    );
  }
}
