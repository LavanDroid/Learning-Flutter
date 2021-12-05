import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_image.dart';
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

  Widget _wAppBar() => GestureDetector(
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: AppColors.grey,
          appBar: const CommonAppBar(
            icon: AppImages.icCustomBack,
            title: 'Check Box',
          ),
          body: _wCheckBoxScreen(),
        ),
      );

  Widget _wCheckBoxScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25.0),
                _wBasicTitle(),
                _wBasicBox(),
                const SizedBox(height: 25.0),
                _wMultipleTitle(),
                ...mListBox.map(_wMultipleBox).toList(),
                const SizedBox(height: 25.0),
                _wListTileTitle(),
                _wListTileBox(),
                const SizedBox(height: 25.0),
                // _wListTileRadioTileButton(),
                // _wSizeBox(height: 50.0),
              ],
            ),
          ),
        ),
      );

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
