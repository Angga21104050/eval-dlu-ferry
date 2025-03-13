import 'package:dlu_project/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/history_controller.dart';
import '../../home/components/navigation_bar.dart' as custom;

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(title: const Text('HistoryView'), centerTitle: true),
      body: const Center(
        child: Text('HistoryView is working', style: TextStyle(fontSize: 20)),
      ),
      bottomNavigationBar: custom.NavigationBar(),
    );
  }
}
