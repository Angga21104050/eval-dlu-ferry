import 'package:get/get.dart';

import '../controllers/my_ticket_detail_controller.dart';

class MyTicketDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTicketDetailController>(
      () => MyTicketDetailController(),
    );
  }
}
