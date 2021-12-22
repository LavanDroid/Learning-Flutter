import 'package:flutter/material.dart';

class SeparatedModel {
  final String name;
  final int id;
  IconData? ic;
  String? subTitle;
  String? img;

  SeparatedModel({
    required this.name,
    required this.id,
    this.ic,
    this.subTitle,
    this.img,
  });
}

class SeparatedList {
  static final dummy = [
    SeparatedModel(
      name: 'List One',
      id: 1,
      ic: Icons.ac_unit,
      subTitle: 'SubOne',
      img: 'https://picsum.photos/250?image=36',
    ),
    SeparatedModel(
      name: 'List Two',
      id: 2,
      ic: Icons.access_alarm,
      subTitle: 'SubTWO',
      img: 'https://picsum.photos/250?image=37',
    ),
    SeparatedModel(
      name: 'List Three',
      id: 3,
      ic: Icons.accessibility,
      img: 'https://picsum.photos/250?image=38',
    ), // subTitle: 'SubTHREE'
  ];
}
