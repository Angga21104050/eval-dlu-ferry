import 'package:get/get.dart';

import '../controllers/my_ticket_controller.dart';

class MyTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTicketController>(
      () => MyTicketController(),
    );
  }
}
