import 'package:flutter/material.dart';

class SeparatedModel {
  final String name;
  final int id;
  IconData? img;
  String? subTitle;

  SeparatedModel({
    required this.name,
    required this.id,
    this.img,
    this.subTitle,
  });
}

class SeparatedList {
  static final dummy = [
    SeparatedModel(
      name: 'List One',
      id: 1,
      img: Icons.ac_unit,
      subTitle: 'SubOne',
    ),
    SeparatedModel(
      name: 'List Two',
      id: 2,
      img: Icons.access_alarm,
      subTitle: 'SubtWO',
    ),
    SeparatedModel(
      name: 'List Three',
      id: 3,
      img: Icons.access_time,
    ), // subTitle: 'SubTHREE'
  ];
}
