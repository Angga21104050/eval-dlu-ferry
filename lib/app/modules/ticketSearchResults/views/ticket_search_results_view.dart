import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ticket_search_results_controller.dart';
import '../../myTicket/components/secondary_appbar.dart';
import '../../../data/list_tiket_dummy.dart';

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

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar Kapal di Sebelah Kiri
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ticket['imageUrl'],
                          height: 100,
                          width:
                              100, // Ukuran gambar lebih kecil agar sesuai dengan desain horizontal
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 100,
                              width: 100,
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.image_not_supported),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12), // Jarak antara gambar dan teks
                      // Informasi Tiket di Sebelah Kanan
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama Kapal
                            Text(
                              ticket['ferryName'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Pelabuhan Keberangkatan & Tujuan
                            Text(
                              '${ticket['departurePort']} → ${ticket['arrivalPort']}',
                            ),

                            // Waktu & Durasi
                            Text(
                              '${ticket['departureTime']} - ${ticket['arrivalTime']} (${ticket['duration']})',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            // const SizedBox(height: 4),

                            // // Tipe Tiket & Kelas
                            // Text('Tipe: ${ticket['ticketType']}'),
                            // Text('Kelas: ${ticket['classes'].join(", ")}'),
                            // const SizedBox(height: 8),

                            // Harga & Tombol Pesan
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rp ${ticket['price']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     // Aksi ketika tombol "Pesan" ditekan
                                //   },
                                //   child: const Text('Pesan'),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
