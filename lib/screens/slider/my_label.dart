import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

import 'utils.dart';

class MyLabelSlider extends StatefulWidget {
  const MyLabelSlider({Key? key}) : super(key: key);

  @override
  _MyLabelSliderState createState() => _MyLabelSliderState();
}

class _MyLabelSliderState extends State<MyLabelSlider> with AppBase {
  int indexTop = 0;
  double valueBottom = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildAppBar(),
    );
  }

  Widget buildAppBar() => SliderTheme(
        data: const SliderThemeData(
          /// ticks in between
          activeTickMarkColor: Colors.transparent,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSliderSideLabel(),
            const SizedBox(height: 16),
            buildSliderTopLabel(),
          ],
        ),
      );

  Widget buildSliderSideLabel() {
    const double min = 20;
    const double max = 80;
    const divisions = 4;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          buildSideLabel(min),
          Expanded(
            child: Slider(
              value: valueBottom,
              min: min,
              max: max,
              divisions: divisions,
              label: valueBottom.round().toString(),
              onChanged: (value) => setState(() => valueBottom = value),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }

  Widget buildSideLabel(double value) => SizedBox(
        width: 25,
        child: Text(
          value.round().toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  Widget buildSliderTopLabel() {
    final labels = ['0', '18', '30', '50', '+'];
    const double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
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
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(
                    label: label.toString(), color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexTop.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          // label: labels[indexTop],
          onChanged: (value) => setState(() => indexTop = value.toInt()),
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
