import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'button_header_widget.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? mDate;

  String getText() {
    if (mDate == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy', 'en-US').format(mDate!);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final mInitialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: mDate ?? mInitialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    setState(() => mDate = newDate ?? mInitialDate);
  }
}
