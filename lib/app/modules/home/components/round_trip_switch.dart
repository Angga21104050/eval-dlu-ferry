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
    return SwitchListTile(
      visualDensity: VisualDensity.compact,
      activeColor: Colors.blue,
      inactiveTrackColor: Colors.white,
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Pulang Pergi',
          style: TextStyle(
            color: Colors.red.shade500,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(right: 0, top: 0),
      value: isRoundTrip,
      onChanged: onChanged,
    );
  }
}
