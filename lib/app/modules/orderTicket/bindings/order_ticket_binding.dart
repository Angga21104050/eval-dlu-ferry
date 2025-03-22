import 'package:get/get.dart';

import '../controllers/order_ticket_controller.dart';

class OrderTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderTicketController>(
      () => OrderTicketController(),
    );
  }
}
