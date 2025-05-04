import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundTripSwitch extends StatelessWidget {
  final bool isRoundTrip;
  final Function(bool) onChanged;

  const RoundTripSwitch({
    Key? key,
    required this.isRoundTrip,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Pulang Pergi',
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 8,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(width: 3),
        SizedBox(
          height: 32,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Switch(
              value: isRoundTrip,
              activeColor: const Color.fromARGB(255, 0, 0, 0),
              inactiveTrackColor: Colors.white,
              focusColor: Colors.blue.shade900,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
