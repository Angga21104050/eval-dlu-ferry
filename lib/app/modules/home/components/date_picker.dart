import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../../constants/text_style.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime initialDate;
  // membedakan pulang dengan pergi
  final String labelText;

  const DatePickerWidget({
    Key? key,
    required this.onDateSelected,
    required this.initialDate,
    required this.labelText,
  }) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56,
      margin: EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          _showCalendarDialog(context); // Menampilkan pop-up kalender
        },
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            labelText: widget.labelText,
            labelStyle: regular.copyWith(
              fontSize: 14,
              color: Color(0xFF757575),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: const Color(0xFFD0CBCB), width: 1),
            ),
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Icon(
                  Icons.calendar_month_outlined,
                  size: 25,
                  color: Color(0xFF0064D2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  DateFormat('dd MMMM yyyy', 'id_ID').format(_selectedDate),
                  style: medium.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Agar efek lebih halus
      barrierColor: Colors.black.withOpacity(0.5), // Efek transparan
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ), // Membuat sudut modal lebih halus
      ),
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: 500), // Durasi animasi
      ),
      builder: (context) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 800), // Animasi transisi
          curve: Curves.easeOut, // Efek animasi lebih halus
          height: 420, // Tinggi modal kalender
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(widget.labelText, style: semiBold.copyWith(fontSize: 20)),
              Expanded(
                child: TableCalendar(
                  locale: 'id_ID',
                  focusedDay: _selectedDate,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(2025, 12, 31),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                    widget.onDateSelected(selectedDay);
                    Navigator.pop(
                      context,
                    ); // Tutup modal setelah memilih tanggal
                  },
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: regular.copyWith(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
