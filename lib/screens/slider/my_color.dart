import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MyColorSlider extends StatefulWidget {
  const MyColorSlider({Key? key}) : super(key: key);

  @override
  _MyColorSliderState createState() => _MyColorSliderState();
}

class _MyColorSliderState extends State<MyColorSlider> with AppBase {
  double mValue = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildColorSlider(),
    );
  }

  /* Widget buildColorsScreen() => Scaffold(
        body: GestureDetector(
          onTap: () => hideKeyBoard(),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: buildColorSlider(),
              ),
            ),
          ),
        ),
      ); */

  Widget buildColorSlider() => SliderTheme(
        data: SliderThemeData(
          thumbColor: Colors.green,
          overlayColor: Colors.green.shade200,
          valueIndicatorColor: Colors.green,

          /// track color
          activeTrackColor: Colors.green.shade200,
          inactiveTrackColor: Colors.black12,

          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCustomSlider(),
            const SizedBox(height: 25),
            buildDefaultSlider(),
          ],
        ),
      );

  Widget buildCustomSlider() => Slider(
        value: mValue,
        min: 0,
        max: 100,
        divisions: 10,
        label: mValue.round().toString(),
        onChanged: (value) => setState(() => mValue = value),
      );

  ///? If we use active/inactive Color, SliderTheme data won't apply
  ///? but valueIndicatorColor only applied
  Widget buildDefaultSlider() => Slider(
        value: mValue,
        min: 0,
        max: 100,
        divisions: 100,
        activeColor: Colors.red,
        inactiveColor: Colors.red.shade100,
        label: mValue.round().toString(),
        onChanged: (value) => setState(() => mValue = value),
      );
}
