import 'package:flutter/material.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/model/check_box_model.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({Key? key}) : super(key: key);

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> with AppBase {
  bool mValue = false, mValue2 = false;

  final mListBox = [
    CheckBoxModel(name: 'CheckBox One'),
    CheckBoxModel(name: 'CheckBox Two'),
    CheckBoxModel(name: 'CheckBox Three'),
  ];
  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => Scaffold(
        backgroundColor: appColor.mGrey,
        appBar: CommonAppBar(
          icon: 'assets/images/ic_custom_back.png',
          title: 'Check Box',
        ),
        body: _wCheckBoxScreen(),
      );

  Widget _wCheckBoxScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _wSizeBox(),
                _wBasicTitle(),
                _wBasicBox(),
                _wSizeBox(),
                _wMultipleTitle(),
                ...mListBox.map(_wMultipleBox).toList(),
                _wSizeBox(),
                _wListTileTitle(),
                _wListTileBox(),
                _wSizeBox(),
                // _wListTileRadioTileButton(),
                // _wSizeBox(height: 50.0),
              ],
            ),
          ),
        ),
      );

  Widget _wSizeBox({double height = 25.0}) {
    return SizedBox(
      height: height,
    );
  }

  Widget _wBasicTitle() => const Text(
        'Basic',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.brown,
        ),
      );

  Widget _wBasicBox() => CheckboxListTile(
        value: mValue,
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onChanged: (value) => setState(() => mValue = value!),
        activeColor: Colors.red,
        controlAffinity: ListTileControlAffinity.leading,
      );

  Widget _wMultipleTitle() => const Text(
        'Multiple Select',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.brown,
        ),
      );

  Widget _wMultipleBox(CheckBoxModel checkBox) => CheckboxListTile(
        value: checkBox.isCheck,
        title: Text(
          checkBox.name,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        onChanged: (value) => setState(() {
          checkBox.isCheck = value!;
          /* for (var element in mListBox) {
            appPrint(element.name + ': ' + element.isCheck.toString());
          } */
        }),
        activeColor: Colors.red,
        controlAffinity: ListTileControlAffinity.leading,
      );

  Widget _wListTileTitle() => const Text(
        'ListTile',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.brown,
        ),
      );

  Widget _wListTileBox() => ListTile(
        onTap: () => setState(() => mValue2 = !mValue2),
        leading: Checkbox(
          value: mValue2,
          onChanged: (value) => setState(() => mValue2 = value!),
        ),
        title: const Text(
          'Click Me',
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      );
}
