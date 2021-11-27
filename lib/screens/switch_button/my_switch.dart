import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MySwitchButton extends StatefulWidget {
  const MySwitchButton({Key? key}) : super(key: key);

  @override
  _MySwitchButtonState createState() => _MySwitchButtonState();
}

class _MySwitchButtonState extends State<MySwitchButton> with AppBase {
  bool _isSwitched = false;
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
            title: 'Switch Buttons',
          ),
          body: _wSwitchScreen(),
        ),
      );

  Widget _wSwitchScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                _wDefaultTitle(),
                _wDefaultSwitch(),
                const SizedBox(height: 25.0),
                _wCustomTitle(),
                _wCustomSwitch(),
                const SizedBox(height: 25.0),
                _wImageTitle(),
                _wImageSwitch(),
                const SizedBox(height: 25.0),
                _wAndroidIosTitle(),
                _wAndroidIosSwitch(),
                const SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      );

  ValueChanged<bool?> _valueChangedHandler() => (value) => setState(() => {
        _isSwitched = value!,
        showToast(_isSwitched.toString()),
      });

  Widget _wDefaultTitle() => const Text(
        'Default',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wDefaultSwitch() => Center(
        child: Switch(
          value: _isSwitched,
          onChanged: _valueChangedHandler(),
        ),
      );

  Widget _wCustomTitle() => const Text(
        'Colour & Size',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wCustomSwitch() => Column(
        children: [
          Transform.scale(
            scale: 2,
            child: Switch(
              value: _isSwitched,
              onChanged: _valueChangedHandler(),
              activeColor: Colors.blue,
              activeTrackColor: Colors.yellow,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.orange,
            ),
          ),
        ],
      );

  Widget _wImageTitle() => const Text(
        'Network/Asset Image',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wImageSwitch() => Column(
        children: [
          Transform.scale(
            scale: 1.5,
            child: Switch(
              value: _isSwitched,
              onChanged: _valueChangedHandler(),
              activeThumbImage:
                  const NetworkImage('https://picsum.photos/id/832/100'),
              inactiveThumbImage:
                  const NetworkImage('https://picsum.photos/id/1027/100'),
              // activeThumbImage: AssetImage("images/cnw.png"),
              // inactiveThumbImage : AssetImage("images/simple_interest.png"),
            ),
          ),
        ],
      );

  Widget _wAndroidIosTitle() => const Text(
        'Change auto platform Android/iOS',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.purpleAccent,
        ),
      );

  Widget _wAndroidIosSwitch() => Transform.scale(
        scale: 1.5,
        child: Switch.adaptive(
          thumbColor: MaterialStateProperty.all(Colors.red),
          trackColor: MaterialStateProperty.all(Colors.orange),

          // activeColor: Colors.blueAccent,
          // activeTrackColor: Colors.blue.withOpacity(0.4),
          // inactiveThumbColor: Colors.orange,
          // inactiveTrackColor: Colors.black87,
          splashRadius: 50,
          value: _isSwitched,
          onChanged: _valueChangedHandler(),
          //value: value,
          //onChanged: (value) => setState(() => this.value = value),
        ),
      );
}
