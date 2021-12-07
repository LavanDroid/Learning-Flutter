import 'package:flutter/material.dart';

import 'button_header_widget.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  // TimeOfDay mTime = const TimeOfDay(hour: 8, minute: 30);
  TimeOfDay? mTime;
  String? strTime;

  String getText() {
    if (strTime == null) {
      return 'Select Time';
    } else {
      /* final hours = mTime!.hour.toString().padLeft(2, '0');
      final minutes = mTime!.minute.toString().padLeft(2, '0');
      return '$hours:$minutes'; */
      return strTime!;
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Time',
        text: getText(),
        onClicked: () => pickTime(context),
      );

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: mTime ?? initialTime,
      builder: (context, childWidget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                // Using 24-Hour format
                alwaysUse24HourFormat: false),
            // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
            child: childWidget!);
      },
    );
    setState(() {
      strTime = (newTime ?? initialTime).format(context);
      mTime = newTime ?? initialTime;
    });
  }
}
