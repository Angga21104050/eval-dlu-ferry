import 'package:flutter/material.dart';

class TicketSelection extends StatefulWidget {
  final List<String> ticketClasses;
  final Function(String, int) onUpdateCart;

  const TicketSelection({
    super.key,
    required this.ticketClasses,
    required this.onUpdateCart,
  });

  @override
  _TicketSelectionState createState() => _TicketSelectionState();
}

class _TicketSelectionState extends State<TicketSelection> {
  Map<String, int> ticketCounts = {};

  @override
  void initState() {
    super.initState();
    for (String cls in widget.ticketClasses) {
      ticketCounts[cls] = 0;
    }
  }

  void incrementTicket(String ticketClass) {
    setState(() {
      ticketCounts[ticketClass] = (ticketCounts[ticketClass] ?? 0) + 1;
      widget.onUpdateCart(ticketClass, ticketCounts[ticketClass]!);
    });
  }

  void decrementTicket(String ticketClass) {
    setState(() {
      if ((ticketCounts[ticketClass] ?? 0) > 0) {
        ticketCounts[ticketClass] = ticketCounts[ticketClass]! - 1;
        widget.onUpdateCart(ticketClass, ticketCounts[ticketClass]!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children:
            widget.ticketClasses.map<Widget>((String value) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                          onPressed: () => decrementTicket(value),
                        ),
                        Text(
                          ticketCounts[value].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.blue,
                          ),
                          onPressed: () => incrementTicket(value),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
