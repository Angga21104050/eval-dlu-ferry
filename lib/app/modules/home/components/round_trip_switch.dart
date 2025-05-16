import 'package:dlu_project/app/constants/text_style.dart';
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
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            Text(
              'Pulang Pergi',
              style: semiBold.copyWith(
                fontSize: 8,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 28,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Switch(
                  value: isRoundTrip,
                  activeTrackColor: Color(0xFF0064D2),
                  inactiveTrackColor: Colors.white,
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
