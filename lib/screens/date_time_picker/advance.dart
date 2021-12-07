import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import 'widget/date_picker_widget.dart';
import 'widget/date_range_picker_widget.dart';
import 'widget/time_picker_widget.dart';

class DateTimeAdvance extends StatefulWidget {
  const DateTimeAdvance({Key? key}) : super(key: key);

  @override
  _DateTimeAdvanceState createState() => _DateTimeAdvanceState();
}

class _DateTimeAdvanceState extends State<DateTimeAdvance> with AppBase {
  @override
  Widget build(BuildContext context) => buildAdvance();

  Widget buildAdvance() => Scaffold(
        backgroundColor: Colors.green[100],
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DatePickerWidget(),
              SizedBox(height: 24),
              TimePickerWidget(),
              SizedBox(height: 24),
              DateRangePickerWidget(),
            ],
          ),
        ),
      );
}
