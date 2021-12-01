import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MyCupertinoSlider extends StatefulWidget {
  const MyCupertinoSlider({Key? key}) : super(key: key);

  @override
  _MyCupertinoSliderState createState() => _MyCupertinoSliderState();
}

class _MyCupertinoSliderState extends State<MyCupertinoSlider> with AppBase {
  double mValue = 50;
  @override
  Widget build(BuildContext context) => buildCupertino();

  Widget buildCupertino() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: CupertinoSlider(
          min: 0,
          max: 100,
          divisions: 20,
          // activeColor: Colors.red.shade500,
          // thumbColor: Colors.red,
          onChanged: (value) => setState(() => mValue = value),
          onChangeStart: (value) => appPrint('Started dragging...'),
          onChangeEnd: (value) => appPrint('Finished dragging...'),
          value: mValue,
        ),
      );
}
