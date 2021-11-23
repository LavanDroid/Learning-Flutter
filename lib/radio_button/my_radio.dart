import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/custom_appbar/common_appbar.dart';
import 'package:flutter_demo/radio_button/radio_button.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CommonAppBar(
        icon: 'assets/images/ic_custom_back.png',
        title: 'Radio Buttons',
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _wSizeBox(height: 25.0),
              _wTextRadioButton(),
              _wRadioGroupButton(),
              _wSizeBox(height: 25.0),
              _wRadioListTileButton(),
              _wSizeBox(height: 25.0),
              _wRowRadioButton(),
              _wSizeBox(height: 25.0),
              _wListTileRadioButton(),
              _wSizeBox(height: 25.0),
              // _wListTileRadioTileButton(),
              // _wSizeBox(height: 50.0),
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
        _wSizeBox(height: 10.0),
        const Text(
          'Radio One',
          style: TextStyle(color: Colors.pink),
        ),
        Radio(
          value: '6',
          groupValue: _radioGroupValue,
          onChanged: _valueChangedHandler(),
        ),
        _wSizeBox(height: 10.0),
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
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: '7',
              groupValue: _radioGroupValue,
              onChanged: _valueChangedHandler(),
              activeColor: Colors.redAccent,
            ),
          ),
          title: const Text('ListTile Radio One'),
        ),
        ListTile(
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: '8',
              groupValue: _radioGroupValue,
              onChanged: _valueChangedHandler(),
              activeColor: Colors.redAccent,
            ),
          ),
          title: const Text('ListTile Radio Two'),
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
