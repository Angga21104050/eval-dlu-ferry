import 'package:get/get.dart';

import '../controllers/ticket_search_results_controller.dart';

class TicketSearchResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketSearchResultsController>(
      () => TicketSearchResultsController(),
    );
  }
}
