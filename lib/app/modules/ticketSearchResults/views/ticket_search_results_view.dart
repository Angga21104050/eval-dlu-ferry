import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ticket_search_results_controller.dart';
import '../../myTicket/components/secondary_appbar.dart';
import '../../../data/list_tiket_dummy.dart';
import '../components/ticket_card.dart';

class TicketSearchResultsView extends GetView<TicketSearchResultsController> {
  const TicketSearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecCustomAppBar(page: 'Tiket'),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0064D2), Colors.white, Colors.white],
              ),
              image: DecorationImage(
                image: AssetImage("assets/img/map-global.png"),
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            itemCount: ferryTickets.length,
            itemBuilder: (context, index) {
              final ticket = ferryTickets[index];

              return TicketCard(ticket: ticket);
            },
          ),
        ],
      ),
    );
  }
}
