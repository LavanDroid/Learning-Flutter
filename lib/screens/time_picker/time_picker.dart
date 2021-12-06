import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({Key? key}) : super(key: key);

  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> with AppBase {
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
