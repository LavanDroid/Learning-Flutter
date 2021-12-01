import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import 'custom_slider_theme.dart';
import 'utils.dart';

class MyShapeSlider extends StatefulWidget {
  const MyShapeSlider({Key? key}) : super(key: key);

  @override
  _MyShapeSliderState createState() => _MyShapeSliderState();
}

class _MyShapeSliderState extends State<MyShapeSlider> with AppBase {
  int indexSlider = 0;
  @override
  Widget build(BuildContext context) => CustomSliderTheme(
        child: buildSlider(),
      );

  Widget buildSlider() {
    final labels = ['0', '18', '30', '50', '+'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                const selectedColor = Colors.black;
                final unselectedColor = Colors.black.withOpacity(0.3);
                final isSelected = index <= indexSlider;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(
                    label: label.toString(), color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexSlider.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          label: labels[indexSlider],
          onChanged: (value) => setState(() => indexSlider = value.toInt()),
        ),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      SizedBox(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );
}
