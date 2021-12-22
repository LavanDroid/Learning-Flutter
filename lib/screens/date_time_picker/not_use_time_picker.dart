import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({Key? key}) : super(key: key);

  @override
  _MyDateTimePickerState createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> with AppBase {
  TimeOfDay timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Time Picker',
        ),
        body: buildTimeScreen(),
        floatingActionButton: buildFloating(),
      );

  Widget buildTimeScreen() => SafeArea(
        child: Center(
          child: buildTimeText(),
        ),
      );

  Widget buildTimeText() => Text(
        timeOfDay.format(context).toString(),
        style: const TextStyle(fontSize: 50),
      );

  Widget buildFloating() => FloatingActionButton(
        child: const Icon(Icons.access_time_outlined),
        onPressed: mShowTimePicker,
        /* onPressed: () async {
          TimeOfDay? newTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (newTime != null) {
            setState(() {
              timeOfDay = newTime;
            });
          }
        }, */
      );

  void mShowTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) => setState(() => timeOfDay = value!),
    );
  }
}
