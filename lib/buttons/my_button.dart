import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/buttons/outline_gradient_button.dart';
import 'package:flutter_demo/custom_appbar/common_appbar.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({Key? key}) : super(key: key);
  //static const String routeName = '/MyButtons';

  /*
   * //? Not use -> want to learn
   * final GlobalKey<ScaffoldMessengerState> _rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
   * 
   * //? Used in Stateless build
   * scaffoldMessengerKey: _rootScaffoldMessengerKey,
   * 
   * //? Used in StatefulWidget build
   * key: _rootScaffoldMessengerKey,
   *  */

  @override
  _MyButtonsState createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> with AppBase {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CommonAppBar(
        icon: 'assets/images/ic_custom_back.png',
        title: 'Buttons',
        whereFrom: 'Veera',
        menuItem: [
          IconButton(
            icon: const Icon(Icons.verified_user),
            onPressed: () => showToast('Clicked Shield'),
          ),
          ElevatedButton(
            onPressed: () => showToast('Clicked Save'),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: const Color(0xff6200ee),
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.transparent)),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _wSizeBox(height: 50.0),
              _wTextElevateButton(),
              _wSizeBox(),
              _wElevateButtonOne(),
              _wSizeBox(),
              _wElevateButtonTwo(),
              _wSizeBox(),
              _wElevateButtonThree(),
              _wSizeBox(),
              _wElevateButtonFour(),
              _wSizeBox(),
              _wElevateButtonFive(),
              _wSizeBox(),
              _wElevateButtonSix(),
              _wSizeBox(height: 50.0),
              _wTextOutlinedButton(),
              _wSizeBox(),
              _wOutlinedButtonOne(),
              _wSizeBox(),
              _wOutlinedButtonTwo(),
              _wSizeBox(),
              _wOutlinedButtonThree(),
              _wSizeBox(),
              _wOutlinedButtonFour(),
              _wSizeBox(height: 50.0),
              _wTextButton(),
              _wSizeBox(),
              _wTextButtonOne(),
              _wSizeBox(),
              _wTextButtonTwo(),
              _wSizeBox(),
              _wTextButtonThree(),
              _wSizeBox(height: 50.0),
              _wTextGradientButton(),
              _wSizeBox(),
              _wTextIconButton(),
              _wSizeBox(),
              _wIconButtonOne(),
              _wSizeBox(height: 50.0),
              _wTextFabButton(),
              _wSizeBox(),
              _wFabOne(),
              _wSizeBox(height: 50.0),
              // _wListViewChildren(),
              _wTextCustomOutlinedButton(),
              _wSizeBox(),
              Wrap(
                spacing: 24, // Horizantal space
                runSpacing: 48, // Verical space
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: _wCustomOutlinedChildren(),
              ),
              _wSizeBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wSizeBox({double height = 25.0}) {
    return SizedBox(
      height: height,
    );
  }

  Widget _wTextElevateButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Elevate Button:-',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _wElevateButtonOne() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Go Back!'),
    );
  }

  Widget _wElevateButtonTwo() {
    return ElevatedButton(
      onPressed: () => showToast('Elevated Button 2'),
      child: const Text('Minmum Width & Height'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(280.0, 55.0),
        textStyle: const TextStyle(fontSize: 28.0),
        primary: Colors.orange, //? Button BG
        onPrimary: Colors.lightBlue, //? Text Color
      ),
    );
  }

  Widget _wElevateButtonThree() {
    return ElevatedButton.icon(
      onPressed: () => showToast('Text color reflected to icon color'),
      label: const Text('Elevated Icon'),
      icon: const Icon(Icons.umbrella),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        //? primary & onPrimary can use
        // primary: Colors.orange, //? Button BG
        // onPrimary: Colors.lightBlue, //? Text Color
      ),
    );
  }

  Widget _wElevateButtonFour() {
    return ElevatedButton.icon(
      onPressed: () => showToast('Text color reflected to icon color'),
      icon: const Text('Elevated Right Icon'),
      label: const Icon(Icons.umbrella),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        //? primary & onPrimary can use
        // primary: Colors.orange, //? Button BG
        // onPrimary: Colors.lightBlue, //? Text Color
      ),
    );
  }

  Widget _wElevateButtonFive() {
    return ElevatedButton.icon(
      onPressed: () => showToast('Icon with Border'),
      label: const Text('Icon With Border'),
      icon: const Icon(Icons.two_wheeler),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        side: const BorderSide(width: 3, color: Colors.white),
        //? primary & onPrimary can use
        // primary: Colors.orange, //? Button BG
        onPrimary: Colors.purple, //? Text Color
      ),
    );
  }

  Widget _wElevateButtonSix() {
    return ElevatedButton.icon(
      //? EB -> ElevatedButton
      //? TB -> TextButton
      //? OB -> OutlinedButton
      onPressed: () => showToast('Rounded shape can use EB/TB/OB'),
      // onPressed: null,
      label: const Text('Rounded EB'),
      icon: const Icon(Icons.two_wheeler),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        side: const BorderSide(width: 3, color: Colors.black),
        //? primary & onPrimary can use
        // primary: Colors.orange, //? Button BG
        //onPrimary: Colors.purple, //? Text Color
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

  Widget _wTextOutlinedButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Outlined Button:-',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _wOutlinedButtonOne() {
    return OutlinedButton(
      onPressed: () => showToast('Minmum Width & Height'),
      child: const Text('Minmum W&H'),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(280.0, 55.0),
        textStyle: const TextStyle(fontSize: 28.0),
        primary: Colors.orange, //? Text Color
        side: const BorderSide(width: 2, color: Colors.blue),
      ),
    );
  }

  Widget _wOutlinedButtonTwo() {
    return OutlinedButton(
      onPressed: () => showToast('Set Only Height'),
      child: const Text('Only Height'),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(55.0),
        textStyle: const TextStyle(fontSize: 28.0),
        primary: Colors.orange, //? Text Color
        side: const BorderSide(width: 2, color: Colors.blue),
      ),
    );
  }

  Widget _wOutlinedButtonThree() {
    return OutlinedButton(
      onPressed: () => showToast('Padding set horizontal & vertical'),
      child: const Text('Padding H&V'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        primary: Colors.orange, //? Text Color
        side: const BorderSide(width: 2, color: Colors.blue),
      ),
    );
  }

  Widget _wOutlinedButtonFour() {
    return OutlinedButton.icon(
      onPressed: () => showToast('Text color reflected to icon color'),
      label: const Text('OutlinedButton Icon'),
      icon: const Icon(Icons.add_reaction),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        side: const BorderSide(width: 2, color: Colors.pink),
        primary: Colors.pink, //? Text Color
      ),
    );
  }

  Widget _wTextButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Text Button:-',
        style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _wTextButtonOne() {
    return TextButton(
      onPressed: () => showToast('Simple TextButton'),
      child: const Text('Text Button'),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        primary: Colors.green, //? Text Color
      ),
    );
  }

  Widget _wTextButtonTwo() {
    return TextButton.icon(
      onPressed: () => showToast('Text color reflected to icon color'),
      icon: const Text('TextButton Icon'),
      label: const Icon(Icons.add_reaction),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        textStyle: const TextStyle(fontSize: 28.0),
        primary: Colors.brown, //? Text Color
      ),
    );
  }

  Widget _wTextButtonThree() {
    return TextButton(
      onPressed: () => showToast('Text Button BG'),
      child: const Text('Text Button BG'),
      style: TextButton.styleFrom(
          minimumSize: const Size(280.0, 55.0),
          textStyle: const TextStyle(fontSize: 28.0),
          primary: Colors.orange, //? Button BG
          backgroundColor: Colors.purple), //? BG
    );
  }

  Widget _wTextGradientButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.orange, Colors.green],
        ),
        shadows: [
          BoxShadow(
              color: Colors.black54,
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(1, 1))
        ],
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        shape: const StadiumBorder(),
        child: const Text(
          'Gradient Button',
          style: TextStyle(color: Colors.white, fontSize: 28.0),
        ),
        onPressed: () {
          showToast('My Gradient Button');
        },
      ),
    );
  }

  Widget _wTextIconButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Icon Button:-',
        style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _wIconButtonOne() {
    return IconButton(
        onPressed: () => showToast('Pressed Setting Icon'),
        iconSize: 55.0,
        icon: const Icon(
          Icons.settings,
          color: Colors.amber,
        ));
  }

  Widget _wTextFabButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'FAB Button:-',
        style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _wFabOne() {
    return FloatingActionButton(
      onPressed: () => showToast('Pressed Floating ActionButton'),
      child: const Icon(Icons.add),
    );
  }

  /* Widget _wListViewChildren() {
    return ListView(
      //scrollDirection: Axis.vertical,
      children: [
        OutlineGradientButton(
          child: const Text('WOW'),
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.pink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          strokeWidth: 4,
        ),
        OutlineGradientButton(
          child: const Text('TEXT'),
          gradient: const LinearGradient(colors: [Colors.pink, Colors.purple]),
          strokeWidth: 4,
          radius: const Radius.circular(8),
        ),
        OutlineGradientButton(
          child: const Text('OMG'),
          gradient: const LinearGradient(
            stops: [0, 0.5, 0.5, 1],
            colors: [Colors.green, Colors.green, Colors.red, Colors.red],
          ),
          strokeWidth: 4,
          corners: const Corners(
              topLeft: Radius.elliptical(16, 14),
              bottomRight: Radius.circular(6)),
        ),
        OutlineGradientButton(
          child: SizedBox(
            width: 52,
            height: 52,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.opacity, color: Colors.grey, size: 24),
                Text('TEXT', style: TextStyle(fontSize: 9)),
              ],
            ),
          ),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.black],
            begin: Alignment(-1, -1),
            end: Alignment(2, 2),
          ),
          strokeWidth: 4,
          padding: EdgeInsets.zero,
          radius: const Radius.circular(26),
        ),
        OutlineGradientButton(
          child: const Text('Linear gradient',
              style: TextStyle(color: Colors.black, fontSize: 10)),
          gradient: LinearGradient(
            colors: List.generate(360,
                (h) => HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor()),
          ),
          strokeWidth: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          radius: const Radius.circular(8),
        ),
        OutlineGradientButton(
          child: const Text('Sweep gradient',
              style: TextStyle(color: Colors.black, fontSize: 10)),
          gradient: SweepGradient(
            colors: List.generate(360,
                (h) => HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor()),
          ),
          strokeWidth: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          radius: const Radius.circular(8),
        ),
        OutlineGradientButton(
          child: const Text('With background color and elevation',
              style: TextStyle(color: Colors.white, fontSize: 12)),
          gradient:
              const LinearGradient(colors: [Colors.greenAccent, Colors.yellow]),
          strokeWidth: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          corners: const Corners(
              topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          backgroundColor: Colors.lightBlue,
          elevation: 4,
          inkWell: true,
          onTap: () => showToast('onTap'),
          onDoubleTap: () => showToast('onDoubleTap'),
          onLongPress: () => showToast('onLongPress'),
        ),
      ],
    );
  } */

  Widget _wTextCustomOutlinedButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Custom Outlined Button:-',
        style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _wCustomOutlinedChildren() {
    return [
      OutlineGradientButton(
        child: const Text('WOW'),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.pink],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        strokeWidth: 4,
        inkWell: true,
        onTap: () => showToast('WOW'),
      ),
      OutlineGradientButton(
        child: const Text('TEXT'),
        gradient: const LinearGradient(colors: [Colors.pink, Colors.purple]),
        strokeWidth: 4,
        radius: const Radius.circular(8),
        inkWell: true,
        onTap: () => showToast('TEXT'),
      ),
      OutlineGradientButton(
        child: const Text('OMG'),
        gradient: const LinearGradient(
          stops: [0, 0.5, 0.5, 1],
          colors: [Colors.green, Colors.green, Colors.red, Colors.red],
        ),
        strokeWidth: 4,
        corners: const Corners(
            topLeft: Radius.elliptical(16, 14),
            bottomRight: Radius.circular(6)),
        inkWell: true,
        onTap: () => showToast('OMG'),
      ),
      OutlineGradientButton(
        child: SizedBox(
          width: 52,
          height: 52,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.opacity, color: Colors.grey, size: 24),
              Text('TEXT', style: TextStyle(fontSize: 9)),
            ],
          ),
        ),
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.black],
          begin: Alignment(-1, -1),
          end: Alignment(2, 2),
        ),
        strokeWidth: 4,
        padding: EdgeInsets.zero,
        radius: const Radius.circular(26),
        inkWell: true,
        onTap: () => showToast('IconText'),
      ),
      OutlineGradientButton(
        child: const Text('Linear gradient',
            style: TextStyle(color: Colors.black, fontSize: 10)),
        gradient: LinearGradient(
          colors: List.generate(
              360, (h) => HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor()),
        ),
        strokeWidth: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        radius: const Radius.circular(8),
        inkWell: true,
        onTap: () => showToast('Linear'),
      ),
      OutlineGradientButton(
        child: const Text('Sweep gradient',
            style: TextStyle(color: Colors.black, fontSize: 10)),
        gradient: SweepGradient(
          colors: List.generate(
              360, (h) => HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor()),
        ),
        strokeWidth: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        radius: const Radius.circular(8),
        inkWell: true,
        onTap: () => showToast('Sweep'),
      ),
      OutlineGradientButton(
        child: const Text('With background color and elevation',
            style: TextStyle(color: Colors.white, fontSize: 12)),
        gradient:
            const LinearGradient(colors: [Colors.greenAccent, Colors.yellow]),
        strokeWidth: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        corners: const Corners(
            topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        backgroundColor: Colors.lightBlue,
        elevation: 4,
        inkWell: true,
        onTap: () => showToast('onTap'),
        onDoubleTap: () => showToast('onDoubleTap'),
        onLongPress: () => showToast('onLongPress'),
      ),
    ];
  }

  /* void showSnack(String text) {
    _rootScaffoldMessengerKey.currentState?.removeCurrentSnackBar();
    _rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBar(content: Text(text)));
  } */
}
