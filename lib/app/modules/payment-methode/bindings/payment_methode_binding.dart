import 'package:get/get.dart';

import '../controllers/payment_methode_controller.dart';

class PaymentMethodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodeController>(
      () => PaymentMethodeController(),
    );
  }
}
