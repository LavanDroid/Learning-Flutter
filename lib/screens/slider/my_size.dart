import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MySizeSlider extends StatefulWidget {
  const MySizeSlider({Key? key}) : super(key: key);

  @override
  _MySizeSliderState createState() => _MySizeSliderState();
}

class _MySizeSliderState extends State<MySizeSlider> with AppBase {
  double mValue = 50;

  @override
  Widget build(BuildContext context) => buildSize();

  Widget buildSize() => SliderTheme(
        data: const SliderThemeData(
          trackHeight: 16,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),

          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              child: Slider(
                value: mValue,
                min: 0,
                max: 100,
                divisions: 20,
                label: mValue.round().toString(),
                onChanged: (value) => setState(() => mValue = value),
              ),
            ),
            const SizedBox(height: 16),
            Slider(
              value: mValue,
              min: 0,
              max: 100,
              divisions: 20,
              label: mValue.round().toString(),
              onChanged: (value) => setState(() => mValue = value),
            ),
          ],
        ),
      );
}
