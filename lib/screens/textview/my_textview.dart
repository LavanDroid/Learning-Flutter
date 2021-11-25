import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:flutter_demo/screens/textview/gradient_text.dart';
import 'package:flutter_demo/screens/textview/marquee_widget.dart';
import 'package:flutter_demo/screens/textview/readmore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

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
          backgroundColor: appColor.mGrey,
          appBar: CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
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
                _wPaintTextview(),
                const SizedBox(height: 25.0),
                _wMultipleLineTextview(),
                const SizedBox(height: 25.0),
                _wReadMoreText(),
                const SizedBox(height: 25.0),
                _wRichText(),
                const SizedBox(height: 25.0),
                _wRichTextIcon(),
                const SizedBox(height: 25.0),
                _wMarqueeTextview(),
                const SizedBox(height: 25.0),
                _wStackTextview(),
                const SizedBox(height: 25.0),
                _wCustomGradientRainbow(),
                const SizedBox(height: 25.0),
                _wCustomGradientFadeOut(),
                const SizedBox(height: 25.0),
                _wCustomGradientText(),
                const SizedBox(height: 25.0),
                _wGradientTextviewTwo(),
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
          fontFamily: "Didoni",
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _wPaintTextview() => Text(
        'Paint Textview',
        style: TextStyle(
          fontSize: 35.0,
          //fontFamily: "Didoni",
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..color = Colors.red
            ..strokeWidth = 2.0
            ..style = PaintingStyle.stroke,
        ),
      );

  Widget _wMultipleLineTextview() => const Text(
        'Multiple Line Textview : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
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
        trimExpandedText: ' show less',
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

  Widget _wMarqueeTextview() => const SizedBox(
        width: double.infinity,
        child: MarqueeWidget(
          direction: Axis.horizontal,
          child: Text(
              'My Marqyee TextView in flutter 12345 67890 abcd efgh ijkl mnop qrst uvwxyz'),
        ),
      );

  Widget _wStackTextview() => Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Stack Textview',
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
            'Stack Textview',
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

  Widget _wGradientTextviewTwo() => Text(
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
