import 'package:flutter/material.dart';
import '../components/cart_ticket.dart';
import '../components/ticket_selection.dart';

class TicketCard extends StatefulWidget {
  final Map<String, dynamic> ticket;
  const TicketCard({super.key, required this.ticket});

  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  bool isExpanded = false;
  List<Map<String, dynamic>> cart = [];

  void updateCart(String ticketClass, int count) {
    setState(() {
      if (count == 0) {
        cart.removeWhere((item) => item['class'] == ticketClass);
      } else {
        int index = cart.indexWhere((item) => item['class'] == ticketClass);
        if (index != -1) {
          cart[index]['count'] = count;
        } else {
          cart.add({'class': ticketClass, 'count': count});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = false;
        });
        FocusScope.of(context).unfocus();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.blueAccent.withOpacity(0.2),
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 150,
                      height: 120, // Menetapkan tinggi pembungkus
                      child: Image.network(
                        widget.ticket['imageUrl'],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover, // Memastikan gambar memenuhi area
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ticket['ferryName'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.ticket['departurePort']} → ${widget.ticket['arrivalPort']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '${widget.ticket['departureDate']})',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${widget.ticket['departureTime']} - ${widget.ticket['arrivalTime']} (${widget.ticket['duration']})',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Dropdown
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment:
                                        Alignment
                                            .centerRight, // Menyelaraskan teks ke kanan
                                    child: Text(
                                      '${widget.ticket['ticketType']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Align(
                                    alignment:
                                        Alignment
                                            .centerRight, // Menyelaraskan teks ke kanan
                                    child: Text(
                                      'Pilih Tiket',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Dropdown Content
              if (isExpanded)
                TicketSelection(
                  ticketClasses: List<String>.from(widget.ticket['classes']),
                  onUpdateCart: updateCart,
                ),
              // Keranjang
              CartWidget(cart: cart),
            ],
          ),
        ),
      ),
    );
  }
}
