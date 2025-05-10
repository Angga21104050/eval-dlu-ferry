import 'package:flutter/material.dart';
import '../components/cart_ticket.dart';
import '../components/ticket_selection.dart';
import 'package:intl/intl.dart';

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
        DateTime? departureDate = widget.ticket['departureDate'] as DateTime?;
        final formattedDate =
            departureDate != null
                ? DateFormat('EEEE, dd MMMM').format(departureDate)
                : '';

        final cartItem = {
          'class': ticketClass,
          'count': count,
          'ferryName': widget.ticket['ferryName'] as String? ?? '',
          'departureTime': widget.ticket['departureTime'] as String? ?? '',
          'arrivalTime': widget.ticket['arrivalTime'] as String? ?? '',
          'departurePort': widget.ticket['departurePort'] as String? ?? '',
          'arrivalPort': widget.ticket['arrivalPort'] as String? ?? '',
          'duration': widget.ticket['duration'] as String? ?? '',
          'date': formattedDate,
        };
        if (index != -1) {
          cart[index] = cartItem;
        } else {
          cart.add(cartItem);
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 110,
                      height: 90,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.ticket['ferryName'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              widget.ticket['departureDate'] != null
                                  ? DateFormat('EEEE, dd MMMM').format(
                                    widget.ticket['departureDate'] as DateTime,
                                  )
                                  : 'Tanggal Tidak Tersedia',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0064D2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${widget.ticket['departurePort']} → ${widget.ticket['arrivalPort']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),

                        Text(
                          (widget.ticket['ticketType'] is List &&
                                  widget.ticket['ticketType'].isNotEmpty)
                              ? (widget.ticket['ticketType'] as List).join(
                                ', ',
                              ) // Gabungkan elemen List dengan koma dan spasi
                              : '${widget.ticket['ticketType']}', // Jika bukan List atau kosong, tampilkan apa adanya
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF0064D2),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.ticket['departureTime']} - ${widget.ticket['arrivalTime']}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              Alignment
                                                  .centerRight, // Menyelaraskan teks ke kanan
                                          child: Text(
                                            'Pilih Tiket',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0064D2),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Dropdown Content
              if (isExpanded)
                TicketSelection(
                  ticketClasses:
                      widget.ticket['classes'] is Map<String, List<String>>
                          ? widget.ticket['classes']
                              as Map<String, List<String>>
                          : {
                            'default': List<String>.from(
                              widget.ticket['classes'],
                            ),
                          },

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
