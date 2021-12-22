import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({Key? key}) : super(key: key);

  @override
  _MyRangeSliderState createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> with AppBase {
  RangeValues mValue = const RangeValues(0.0, 5.0);
  late RangeLabels mLabel;
  @override
  Widget build(BuildContext context) {
    mLabel = RangeLabels(
      mValue.start.toString(),
      mValue.end.toString(),
    );
    return Container(
      child: buildSlider(),
    );
  }

  /* Widget buildRangeScreen() => Scaffold(
        body: GestureDetector(
          onTap: () => hideKeyBoard(),
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25.0),
                    buildSlider(),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ); */

  Widget buildSlider() => Center(
        child: RangeSlider(
          values: mValue,
          divisions: 10,
          min: 0.0,
          max: 5.0,
          labels: mLabel,
          onChanged: (value) => setState(() => mValue = value),
        ),
      );
}
