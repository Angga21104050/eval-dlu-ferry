import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTicketController extends GetxController {
  final isScrolled = false.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 100 && !isScrolled.value) {
        isScrolled.value = true;
      } else if (scrollController.offset <= 100 && isScrolled.value) {
        isScrolled.value = false;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
