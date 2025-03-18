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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Pulang Pergi',
          style: TextStyle(
            color: Colors.red.shade500,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(width: 3),
        SizedBox(
          height: 38,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Switch(
              value: isRoundTrip,
              activeColor: Colors.blue.shade500,
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
