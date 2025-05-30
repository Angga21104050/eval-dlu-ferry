import 'package:dlu_project/app/data/list_tiket_dummy.dart';
import 'package:flutter/material.dart';
import '../components/cart_ticket.dart';
import '../components/ticket_selection.dart';
import 'package:intl/intl.dart';
import '../../../constants/text_style.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.blue.withOpacity(0.2),
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          widget.ticket['imageUrl'],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
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
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// Bagian ini diperbaiki
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.ticket['ferryName'],
                                style: semiBold.copyWith(
                                  fontSize: 14,
                                  color: Color(0xFF0064D2),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Tersedia dari',
                                  style: medium.copyWith(
                                    fontSize: 10,
                                    color: Colors.grey.shade500,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  'Rp. 300.000',
                                  style: semiBold.copyWith(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Container(
                          padding: EdgeInsets.only(
                            left: 4,
                            right: 4,
                            top: 2,
                            bottom: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFE6F2FE),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.directions_ferry_outlined,
                                    color: Color(0xFF0064D2),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      '${widget.ticket['departurePort']}',
                                      style: semiBold.copyWith(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xFF0064D2),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      '${widget.ticket['arrivalPort']}',
                                      style: semiBold.copyWith(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: Text(
                                        (widget.ticket['ticketType'] is List &&
                                                widget
                                                    .ticket['ticketType']
                                                    .isNotEmpty)
                                            ? (widget.ticket['ticketType']
                                                    as List)
                                                .join(', ')
                                            : '${widget.ticket['ticketType']}',
                                        style: medium.copyWith(fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isExpanded = !isExpanded;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 2.0,
                                          ),
                                          child: Text(
                                            '${widget.ticket['departureTime']} - ${widget.ticket['arrivalTime']}',
                                            style: semiBold.copyWith(
                                              fontSize: 8,
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Lihat Kelas',
                                              style: semiBold.copyWith(
                                                fontSize: 12,
                                                color: Color(0xFF0064D2),
                                              ),
                                            ),
                                            Icon(
                                              isExpanded
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: Color(0xFF0064D2),
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
              CartWidget(
                cart: cart,
                onClearCart: () {
                  setState(() {
                    cart.clear();
                  });
                },
                ferryTickets: ferryTickets,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
