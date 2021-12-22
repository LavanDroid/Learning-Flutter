import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/slider/my_color.dart';

import 'my_cupertino.dart';
import 'my_disabled.dart';
import 'my_label.dart';
import 'my_range.dart';
import 'my_shape.dart';
import 'my_size.dart';
import 'my_vertical.dart';
import 'tab_bar_widget.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Sliders',
        tabs: const [
          Tab(icon: Icon(Icons.color_lens), text: 'Colors'),
          Tab(icon: Icon(Icons.photo_size_select_large), text: 'Size'),
          Tab(icon: Icon(Icons.text_fields), text: 'Labels'),
          Tab(icon: Icon(Icons.format_shapes), text: 'Shape'),
          Tab(icon: Icon(Icons.invert_colors_on_sharp), text: 'Cupertino'),
          Tab(icon: Icon(Icons.clear), text: 'Disabled'),
          Tab(icon: Icon(Icons.vertical_align_bottom_sharp), text: 'Vertical'),
          Tab(icon: Icon(Icons.social_distance_sharp), text: 'Range'),
        ],
        children: [
          const MyColorSlider(),
          const MySizeSlider(),
          const MyLabelSlider(),
          const MyShapeSlider(),
          const MyCupertinoSlider(),
          const MyDisabledSlider(),
          const MyVerticalSlider(),
          const MyRangeSlider()
        ].map((child) => Center(child: child)).toList(),
      );
}
