import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'toggle_switch.dart';

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({Key? key}) : super(key: key);

  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> with AppBase {
  bool animateFlag = false;
  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          appBar: const CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'Toggle Buttons',
          ),
          body: _wToggleScreen(),
        ),
      );

  Widget _wToggleScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                _wBasicTitle(),
                _wBasicToggle(),
                const SizedBox(height: 25.0),
                _wHeightTitle(),
                _wHeightToggle(),
                const SizedBox(height: 25.0),
                _wTextOrIconTitle(),
                _wTextOrIconToggle(),
                const SizedBox(height: 25.0),
                _wTextIconBgColorTitle(),
                _wTextIconBgColorToggle(),
                const SizedBox(height: 25.0),
                _wBorderColorTitle(),
                _wBorderColorToggle(),
                const SizedBox(height: 25.0),
                _wGradientTitle(),
                _wGradientToggle(),
                const SizedBox(height: 25.0),
                _wRadiusTitle(),
                _wRadiusToggle(),
                const SizedBox(height: 25.0),
                _wCustomTextTitle(),
                _wCustomTextToggle(),
                const SizedBox(height: 25.0),
                _wCustomIconTitle(),
                _wCustomIconToggle(),
                const SizedBox(height: 25.0),
                _wAnimateTitle(),
                _wAnimateToggle(),
                const SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      );

  /* ValueChanged<bool?> _valueChangedHandler() => (value) => setState(() => {
        _isSwitched = value!,
        showToast(_isSwitched.toString()),
      }); */

  Widget _wBasicTitle() => const Text(
        'Basic',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wBasicToggle() => ToggleSwitch(
        initialLabelIndex: 0,
        minWidth: 80.0,
        totalSwitches: 3,
        labels: const ['Jeya', 'Veera', 'Pandian'],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wHeightTitle() => const Text(
        'Height & Font size',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wHeightToggle() => ToggleSwitch(
        minWidth: 110.0,
        minHeight: 90.0,
        fontSize: 25.0,
        initialLabelIndex: 1,
        activeBgColor: const [Colors.green],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.grey[900],
        totalSwitches: 3,
        labels: const ['Apple', 'Orange', 'Banana'],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wTextOrIconTitle() => const Text(
        'Text Or Icon',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wTextOrIconToggle() => ToggleSwitch(
        minWidth: 90.0,
        cornerRadius: 20.0,
        activeBgColors: const [
          [Colors.cyan],
          [Colors.redAccent]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        totalSwitches: 2,
        labels: const ['TEXT', ''],
        icons: const [null, FontAwesomeIcons.times],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wTextIconBgColorTitle() => const Text(
        'Text Icon BgColor',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wTextIconBgColorToggle() => ToggleSwitch(
        minWidth: 90.0,
        initialLabelIndex: 1,
        cornerRadius: 20.0,
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        totalSwitches: 2,
        labels: const ['Male', 'Female'],
        icons: const [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
        activeBgColors: const [
          [Colors.blue],
          [Colors.pink]
        ],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wBorderColorTitle() => const Text(
        'Border & Icon size',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wBorderColorToggle() => ToggleSwitch(
        minWidth: 90.0,
        minHeight: 70.0,
        initialLabelIndex: 2,
        cornerRadius: 20.0,
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        totalSwitches: 3,
        icons: const [
          FontAwesomeIcons.mars,
          FontAwesomeIcons.venus,
          FontAwesomeIcons.transgender
        ],
        iconSize: 30.0,
        borderWidth: 2.0,
        borderColor: const [Colors.blueGrey],
        activeBgColors: const [
          [Colors.blue],
          [Colors.pink],
          [Colors.purple]
        ],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wGradientTitle() => const Text(
        'Gradient',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wGradientToggle() => ToggleSwitch(
        minWidth: 90.0,
        minHeight: 70.0,
        initialLabelIndex: 0,
        cornerRadius: 20.0,
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        totalSwitches: 3,
        icons: const [
          FontAwesomeIcons.facebook,
          FontAwesomeIcons.twitter,
          FontAwesomeIcons.instagram
        ],
        iconSize: 30.0,
        borderColor: const [
          Color(0xff3b5998),
          Color(0xff8b9dc3),
          Color(0xff00aeff),
          Color(0xff0077f2),
          Color(0xff962fbf),
          Color(0xff4f5bd5)
        ],
        dividerColor: Colors.blueGrey,
        activeBgColors: const [
          [Color(0xff3b5998), Color(0xff8b9dc3)],
          [Color(0xff00aeff), Color(0xff0077f2)],
          [
            Color(0xfffeda75),
            Color(0xfffa7e1e),
            Color(0xffd62976),
            Color(0xff962fbf),
            Color(0xff4f5bd5)
          ]
        ],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wRadiusTitle() => const Text(
        'Radius',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wRadiusToggle() => ToggleSwitch(
        minWidth: 90.0,
        cornerRadius: 20.0,
        activeBgColors: [
          [Colors.green[800]!],
          [Colors.red[800]!]
        ],
        activeFgColor: Colors.white,
        inactiveBgColor: Colors.grey,
        inactiveFgColor: Colors.white,
        initialLabelIndex: 1,
        totalSwitches: 2,
        labels: const ['True', 'False'],
        radiusStyle: true,
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wCustomTextTitle() => const Text(
        'Custom Text',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wCustomTextToggle() => ToggleSwitch(
        minWidth: 90.0,
        cornerRadius: 20.0,
        inactiveFgColor: Colors.white,
        initialLabelIndex: 1,
        totalSwitches: 3,
        labels: const ['Normal', 'Bold', 'Italic'],
        customTextStyles: const [
          null,
          TextStyle(
              color: Colors.brown, fontSize: 18.0, fontWeight: FontWeight.w900),
          TextStyle(
              color: Colors.black, fontSize: 16.0, fontStyle: FontStyle.italic)
        ],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wCustomIconTitle() => const Text(
        'Custom Icon',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wCustomIconToggle() => ToggleSwitch(
        minWidth: 90.0,
        minHeight: 90.0,
        cornerRadius: 20.0,
        activeBgColors: const [
          [Color(0xfffdbb0a)],
          [Colors.black54],
          [Colors.white54]
        ],
        inactiveFgColor: Colors.white,
        initialLabelIndex: 2,
        totalSwitches: 3,
        customIcons: const [
          Icon(
            FontAwesomeIcons.ccVisa,
            color: Color(0xff1a1f71),
            size: 55.0,
          ),
          Icon(
            FontAwesomeIcons.ccMastercard,
            color: Color(0xffF79E1B),
            size: 55.0,
          ),
          Icon(
            FontAwesomeIcons.ccAmex,
            color: Color(0xff27AEE3),
            size: 55.0,
          )
        ],
        onToggle: (index) {
          showToast(index.toString());
        },
      );

  Widget _wAnimateTitle() => const Text(
        'Animated Toggle',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wAnimateToggle() => GestureDetector(
        onTap: clickedToggleButtons,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: animateFlag
                  ? Colors.greenAccent[100]
                  : Colors.redAccent[100]!.withOpacity(0.5)),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  top: 3.0,
                  left: animateFlag ? 60.0 : 0.0,
                  right: animateFlag ? 0.0 : 60.0,
                  child: InkWell(
                    onTap: clickedToggleButtons,
                    child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            child: child,
                            scale: animation,
                          );
                        },
                        child: animateFlag
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 35.0,
                                key: UniqueKey(),
                              )
                            : Icon(
                                Icons.remove_circle_outline,
                                color: Colors.red,
                                size: 35.0,
                                key: UniqueKey(),
                              )),
                  ))
            ],
          ),
        ),
      );

  clickedToggleButtons() {
    setState(() => animateFlag = !animateFlag);
  }
}
