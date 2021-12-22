import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';

import 'radio_button.dart';

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({Key? key}) : super(key: key);

  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> with AppBase {
  String? _radioGroupValue;
  int selectedRadioTile = 0;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => {
          _radioGroupValue = value!,
          showToast(_radioGroupValue ?? 'Something Wrong Radio'),
        });
  }

  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: AppColors.grey,
          appBar: const CommonAppBar(
            icon: 'assets/images/ic_custom_back.png',
            title: 'Radio Buttons',
          ),
          body: _wRadioButtonScreen(),
        ),
      );

  Widget _wRadioButtonScreen() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25.0),
                  _wTextRadioButton(),
                  _wRadioGroupButton(),
                  const SizedBox(height: 25.0),
                  _wRadioListTileButton(),
                  const SizedBox(height: 25.0),
                  _wRowRadioButton(),
                  const SizedBox(height: 25.0),
                  _wListTileRadioButton(),
                  const SizedBox(height: 25.0),
                  // _wListTileRadioTileButton(),
                  // _wSizeBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _wTextRadioButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        'Radio Button:-',
        style: TextStyle(
            fontSize: 25.0,
            color: Colors.red,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _wRadioGroupButton() {
    return Column(
      children: [
        MyRadioOption<String>(
          value: '1',
          groupValue: _radioGroupValue,
          onChanged: _valueChangedHandler(),
          label: '1',
          text: 'Custom One',
        ),
        MyRadioOption<String>(
          value: '2',
          groupValue: _radioGroupValue,
          onChanged: _valueChangedHandler(),
          label: '2',
          text: 'Custom Two',
        ),
      ],
    );
  }

  Widget _wRadioListTileButton() {
    return Column(
      children: [
        RadioListTile(
          value: '3',
          groupValue: _radioGroupValue, // selectedRadioTile,
          title: const Text(
            "RadioListTile One",
            style: TextStyle(fontSize: 22.0),
          ),
          //subtitle: const Text("Radio 1 Subtitle"),
          onChanged: _valueChangedHandler(),
          activeColor: Colors.green,
          //selected: true,
        ),
        RadioListTile(
          value: '4',
          groupValue: _radioGroupValue, // selectedRadioTile,
          title: const Text(
            "RadioListTile Two",
            style: TextStyle(fontSize: 22.0),
          ),
          //subtitle: const Text("Radio 1 Subtitle"),
          onChanged: _valueChangedHandler(),
          activeColor: Colors.green,
          //selected: true,
        ),
      ],
    );
  }

  Widget _wRowRadioButton() {
    return Row(
      children: [
        Radio(
          value: '5',
          groupValue: _radioGroupValue,
          onChanged: _valueChangedHandler(),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Radio One',
          style: TextStyle(color: Colors.pink),
        ),
        Radio(
          value: '6',
          groupValue: _radioGroupValue,
          onChanged: _valueChangedHandler(),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Radio Two',
          style: TextStyle(fontSize: 30.0),
        ),
      ],
    );
  }

  Widget _wListTileRadioButton() {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() {
            _radioGroupValue = '7';
            showToast(_radioGroupValue ?? 'Something Wrong onTap');
          }),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: '7',
              groupValue: _radioGroupValue,
              onChanged: _valueChangedHandler(),
              activeColor: Colors.redAccent,
            ),
          ),
          title: const Text(
            'ListTile Radio One',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        ListTile(
          onTap: () => setState(() {
            _radioGroupValue = '8';
            showToast(_radioGroupValue ?? 'Something Wrong onTap');
          }),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: '8',
              groupValue: _radioGroupValue,
              onChanged: _valueChangedHandler(),
              activeColor: Colors.redAccent,
            ),
          ),
          title: const Text(
            'ListTile Radio Two',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  /* Widget _wListTileRadioTileButton() {
    return Column(
      children: [
        ListTile(
          leading: Transform.scale(
            scale: 1.5,
            child: RadioListTile(
              value: '9',
              groupValue: _radioGroupValue, // selectedRadioTile,
              title: const Text(
                "ListTile RadioListTile One",
                style: TextStyle(fontSize: 22.0),
              ),
              //subtitle: const Text("Radio 1 Subtitle"),
              onChanged: _valueChangedHandler(),
              activeColor: Colors.teal,
              //selected: true,
            ),
          ),
        ),
        ListTile(
          leading: Transform.scale(
            scale: 1.5,
            child: RadioListTile(
              value: '10',
              groupValue: _radioGroupValue, // selectedRadioTile,
              title: const Text(
                "ListTile RadioListTile Two",
                style: TextStyle(fontSize: 22.0),
              ),
              //subtitle: const Text("Radio 1 Subtitle"),
              onChanged: _valueChangedHandler(),
              activeColor: Colors.teal,
              //selected: true,
            ),
          ),
        ),
      ],
    );
  } */
}
