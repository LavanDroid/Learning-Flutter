import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MyDisabledSlider extends StatefulWidget {
  const MyDisabledSlider({Key? key}) : super(key: key);

  @override
  _MyDisabledSliderState createState() => _MyDisabledSliderState();
}

class _MyDisabledSliderState extends State<MyDisabledSlider> with AppBase {
  double mValue = 50;
  @override
  Widget build(BuildContext context) => buildDisabled();

  Widget buildDisabled() => SliderTheme(
        data: SliderThemeData(
          /// track color
          disabledActiveTrackColor: Colors.blue.shade100,
          disabledInactiveTrackColor: Colors.black12,

          /// thumb color
          disabledThumbColor: Colors.blue.shade200,

          /// ticks color in between
          disabledInactiveTickMarkColor: Colors.transparent,
          disabledActiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: mValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: mValue.round().toString(),
              onChanged: null,
            ),
            /* const SizedBox(height: 16),
            Slider(
              value: mValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: mValue.round().toString(),
              onChanged: null,
            ), */
          ],
        ),
      );
}
