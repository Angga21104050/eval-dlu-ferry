import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_ticket_controller.dart';

class OrderTicketView extends GetView<OrderTicketController> {
  const OrderTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderTicketView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OrderTicketView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
