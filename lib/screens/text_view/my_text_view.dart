import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

import 'gradient_text.dart';
import 'marquee_widget.dart';
import 'read_more.dart';

class MyTextView extends StatefulWidget {
  const MyTextView({Key? key}) : super(key: key);

  @override
  _MyTextViewState createState() => _MyTextViewState();
}

class _MyTextViewState extends State<MyTextView> with AppBase {
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      Fluttertoast.showToast(msg: 'Clicked Register');
    };
  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: AppColors.grey,
          appBar: const CommonAppBar(
            icon: AppImages.icCustomBack,
            title: 'TextView',
          ),
          body: _wTextViewScreen(),
        ),
      );

  Widget _wTextViewScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                _wHelloTextView(),
                const SizedBox(height: 25.0),
                _wFontFamilyText(),
                const SizedBox(height: 25.0),
                _wPaintTextView(),
                const SizedBox(height: 25.0),
                _wMultipleLineTextView(),
                const SizedBox(height: 25.0),
                _wReadMoreText(),
                const SizedBox(height: 25.0),
                _wRichText(),
                const SizedBox(height: 25.0),
                _wRichTextIcon(),
                const SizedBox(height: 25.0),
                _wMarqueeTextView(),
                const SizedBox(height: 25.0),
                _wStackTextView(),
                const SizedBox(height: 25.0),
                _wCustomGradientRainbow(),
                const SizedBox(height: 25.0),
                _wCustomGradientFadeOut(),
                const SizedBox(height: 25.0),
                _wCustomGradientText(),
                const SizedBox(height: 25.0),
                _wGradientTextViewTwo(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      );

  Widget _wHelloTextView() => Text(
        'Hello World!',
        style: TextStyle(
            fontSize: 35.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.combine([
              TextDecoration.overline,
              TextDecoration.underline,
            ]),
            decorationThickness: 2.0,
            decorationColor: Colors.teal,
            decorationStyle: TextDecorationStyle.double,
            letterSpacing: 5.0,
            wordSpacing: 25.0,
            shadows: const [
              Shadow(
                color: Colors.black,
                blurRadius: 2.0,
                offset: Offset(5, 1),
              ),
            ]),
      );

  Widget _wFontFamilyText() => const Text(
        'Font Family Text',
        style: TextStyle(
          fontSize: 35.0,
          color: Colors.purpleAccent,
          fontFamily: "gos",
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _wPaintTextView() => Text(
        'Paint TextView',
        style: TextStyle(
          fontSize: 35.0,
          //fontFamily: "gos",
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..color = Colors.red
            ..strokeWidth = 2.0
            ..style = PaintingStyle.stroke,
        ),
      );

  Widget _wMultipleLineTextView() => const Text(
        'Multiple Line TextView : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularized in the 1960s with the release of Leeriest sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Lauds PageMaker including versions of Lorem Ipsum.',
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.black,
        ),
        textAlign: TextAlign.justify,
        //? Max Line
        maxLines: 3,
        //? Single Line
        //softWrap: false,
        //maxLines: 1,
        // End of text ...
        overflow: TextOverflow.ellipsis,
      );

  Widget _wReadMoreText() => const ReadMoreText(
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.mLine,
        style: TextStyle(
          fontSize: 17.0,
          color: Colors.black,
        ),
        trimCollapsedText: 'Show more',
        trimExpandedText: ' Show less',
      );

  Widget _wRichText() => RichText(
        text: TextSpan(
            text: 'RT : Don\'t have a account? ',
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                  text: 'Register',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: _gestureRecognizer),
            ]),
      );

  Widget _wRichTextIcon() => RichText(
        text: const TextSpan(
            text: 'RT: Share ',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
            children: [
              WidgetSpan(
                child: Icon(Icons.share),
                alignment: PlaceholderAlignment.middle,
              ),
            ]),
      );

  Widget _wMarqueeTextView() => const SizedBox(
        width: double.infinity,
        child: MarqueeWidget(
          direction: Axis.horizontal,
          child: Text(
              'My Marquee TextView in flutter 12345 67890 latest and breaking News today in tamil and english'),
        ),
      );

  Widget _wStackTextView() => Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Stack TextView',
            style: TextStyle(
              fontSize: 40,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.blue[700]!,
            ),
          ),
          // Solid text as fill.
          Text(
            'Stack TextView',
            style: TextStyle(
              fontSize: 40,
              color: Colors.orange[300],
            ),
          ),
        ],
      );

  Widget _wCustomGradientRainbow() => const GradientText(
        'Rainbow',
        style: TextStyle(fontSize: 40),
        gradient: LinearGradient(colors: [
          Colors.red,
          Colors.pink,
          Colors.purple,
          Colors.deepPurple,
          Colors.deepPurple,
          Colors.indigo,
          Colors.blue,
          Colors.lightBlue,
          Colors.cyan,
          Colors.teal,
          Colors.green,
          Colors.lightGreen,
          Colors.lime,
          Colors.yellow,
          Colors.amber,
          Colors.orange,
          Colors.deepOrange,
        ]),
      );

  Widget _wCustomGradientFadeOut() => GradientText(
        'Fade out',
        style: const TextStyle(fontSize: 40),
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange,
            Colors.deepOrange.withAlpha(0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      );

  Widget _wCustomGradientText() => GradientText(
        'Linear Gradient',
        style: const TextStyle(fontSize: 40),
        gradient: LinearGradient(colors: [
          Colors.blue.shade400,
          Colors.blue.shade900,
        ]),
      );

  Widget _wGradientTextViewTwo() => Text(
        'Paint Gradient',
        style: TextStyle(
            fontSize: 40,
            foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 20),
                const Offset(150, 20),
                <Color>[
                  Colors.red,
                  Colors.lime,
                ],
              )),
      );
}
