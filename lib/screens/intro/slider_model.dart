import 'package:flutter_demo/constants/app_image.dart';

class SliderModel {
  final String imageAssetPath, title, desc;

  SliderModel(
      {required this.imageAssetPath, required this.title, required this.desc});
}

final introList = <SliderModel>[
  SliderModel(
    imageAssetPath: AppImages.bgIntroOne,
    title: 'Search',
    desc:
        'Discover Restaurants offering the best fast food food near you on Foodwa',
  ),
  SliderModel(
    imageAssetPath: AppImages.bgIntroTwo,
    title: 'Order',
    desc:
        'Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins',
  ),
  SliderModel(
    imageAssetPath: AppImages.bgIntroThree,
    title: 'Eat',
    desc:
        'Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.',
  ),
];
