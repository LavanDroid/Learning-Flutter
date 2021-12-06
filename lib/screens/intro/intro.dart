import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_constants.dart';
import 'package:flutter_demo/screens/intro/slide_tile.dart';

import 'slider_model.dart';

class MyIntroduction extends StatefulWidget {
  const MyIntroduction({Key? key}) : super(key: key);

  @override
  _MyIntroductionState createState() => _MyIntroductionState();
}

class _MyIntroductionState extends State<MyIntroduction> with AppBase {
  late List<SliderModel> mIntroList = [];
  late int slideIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    controller = PageController();
    setState(() => mIntroList = introList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SizedBox(
          height: getScreenHeight(context) - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (idx) => setState(
              () => slideIndex = idx,
            ),
            children: <Widget>[
              SlideTile(
                imagePath: mIntroList[0].imageAssetPath,
                title: mIntroList[0].title,
                desc: mIntroList[0].desc,
              ),
              SlideTile(
                imagePath: mIntroList[1].imageAssetPath,
                title: mIntroList[1].title,
                desc: mIntroList[1].desc,
              ),
              SlideTile(
                imagePath: mIntroList[2].imageAssetPath,
                title: mIntroList[2].title,
                desc: mIntroList[2].desc,
              ),
            ],
          ),
        ),

        //? Bottom Style One
        /* 
      bottomSheet: slideIndex != 2
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildSkipButton(),
                  Row(
                    children: [
                      for (int i = 0; i < (mIntroList.length); i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                  buildNextButton(),
                ],
              ),
            )
          : buildGetStarted(), 
          */

        //? Bottom Style Two
        bottomSheet: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildSkipButton(),
              Row(
                children: [
                  for (int i = 0; i < (mIntroList.length); i++)
                    i == slideIndex
                        ? _buildPageIndicator(true)
                        : _buildPageIndicator(false),
                ],
              ),
              slideIndex != 2 ? buildNextButton() : buildDoneButton(),
            ],
          ),
        ));
  }

  Widget buildSkipButton() => Visibility(
        visible: slideIndex != 2,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        child: TextButton(
            child: const Text(
              'Skip',
              style: TextStyle(
                  color: AppColors.scienceBlue, fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              controller.animateToPage(2,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear);
              showToast('SKIP');
            }),
      );

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget buildNextButton() => TextButton(
      child: const Text(
        'Next',
        style: TextStyle(
            color: AppColors.scienceBlue, fontWeight: FontWeight.w600),
      ),
      onPressed: () {
        controller.animateToPage(slideIndex + 1,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
        showToast('NEXT');
      });

  Widget buildGetStarted() => InkWell(
        onTap: () {
          showToast("Get Started Now");
        },
        child: Container(
          height: AppConstants.isIOS ? 65 : 55,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            "GET STARTED NOW",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      );

  Widget buildDoneButton() => TextButton(
      child: const Text(
        'Done',
        style: TextStyle(
            color: Colors.green,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w800),
      ),
      onPressed: () {
        showToast('Done');
      });
}
