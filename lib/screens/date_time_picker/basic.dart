import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import 'widget/datetime_picker_widget.dart';

class DateTimeBasic extends StatefulWidget {
  const DateTimeBasic({Key? key}) : super(key: key);

  @override
  _DateTimeBasicState createState() => _DateTimeBasicState();
}

class _DateTimeBasicState extends State<DateTimeBasic> with AppBase {
  @override
  Widget build(BuildContext context) => buildBasic();

  Widget buildBasic() => Scaffold(
        backgroundColor: Colors.pink[100],
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DateTimePickerWidget(),
            ],
          ),
        ),
      );
}
