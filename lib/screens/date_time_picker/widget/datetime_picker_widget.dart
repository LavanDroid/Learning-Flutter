import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'button_header_widget.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({Key? key}) : super(key: key);

  @override
  _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  DateTime? dateTime;

  String getText() {
    if (dateTime == null) {
      return 'Select Date & Time';
    } else {
      return DateFormat('MM/dd/yyyy hh:mm:aa', 'en-US')
          .format(dateTime ?? DateTime.now()); // HH:mm
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'DateTime',
        text: getText(),
        onClicked: () => pickDateTime(context),
      );

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    final time = await pickTime(context);

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    return newDate ?? initialDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      // initialTime: TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute),
      initialTime: initialTime,
    );
    return newTime ?? initialTime;
  }
}
