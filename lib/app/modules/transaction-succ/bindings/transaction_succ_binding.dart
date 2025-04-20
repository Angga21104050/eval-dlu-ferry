import 'package:get/get.dart';

import '../controllers/transaction_succ_controller.dart';

class TransactionSuccBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionSuccController>(
      () => TransactionSuccController(),
    );
  }
}
