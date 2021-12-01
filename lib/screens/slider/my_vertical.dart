import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MyVerticalSlider extends StatefulWidget {
  const MyVerticalSlider({Key? key}) : super(key: key);

  @override
  _MyVerticalSliderState createState() => _MyVerticalSliderState();
}

class _MyVerticalSliderState extends State<MyVerticalSlider> with AppBase {
  double value = 75;
  final double min = 0;
  final double max = 100;
  @override
  Widget build(BuildContext context) => buildVerticalSlider();

  Widget buildVerticalSlider() => SliderTheme(
        data: SliderThemeData(
          trackHeight: 80,
          thumbShape: SliderComponentShape.noOverlay,
          overlayShape: SliderComponentShape.noOverlay,
          valueIndicatorShape: SliderComponentShape.noOverlay,

          // trackShape: const RectangularSliderTrackShape(),

          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: SizedBox(
          height: 360,
          child: Column(
            children: [
              buildSideLabel(max),
              const SizedBox(height: 16),
              Expanded(
                child: Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        value: value,
                        min: min,
                        max: max,
                        divisions: 20,
                        label: value.round().toString(),
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${value.round()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              buildSideLabel(min),
            ],
          ),
        ),
      );

  Widget buildSideLabel(double value) => Text(
        value.round().toString(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );
}
