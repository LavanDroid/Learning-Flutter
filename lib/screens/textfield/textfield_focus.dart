import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/screens/buttons/common_button.dart';

class TextFieldFocus extends StatefulWidget {
  const TextFieldFocus({Key? key}) : super(key: key);

  @override
  _TextFieldFocusState createState() => _TextFieldFocusState();
}

class _TextFieldFocusState extends State<TextFieldFocus> with AppBase {
  bool isEnabled = true;
  final node1 = FocusNode();
  final node2 = FocusNode();

  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        //? Hide the soft keyboard by clicking outside of TextField or anywhere on the screen
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: appColor.mGrey,
          body: _wFocusScreen(),
        ),
      );

  Widget _wFocusScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                buildTextFieldOne(),
                const SizedBox(height: 25.0),
                buildTextFieldTwo(),
                const SizedBox(height: 50.0),
                buildFocusOne(),
                const SizedBox(height: 25.0),
                buildFocusTwo(),
                const SizedBox(height: 25.0),
                buildUnFocus(),
                const SizedBox(height: 25.0),
                buildEnableDisable(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      );

  Widget buildTextFieldOne() => TextFormField(
        focusNode: node1,
        decoration: InputDecoration(
          labelText: 'TextField 1',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {},
          ),
        ),
        enabled: isEnabled,
        readOnly: !isEnabled,
      );

  Widget buildTextFieldTwo() => TextFormField(
        focusNode: node2,
        decoration: const InputDecoration(
          labelText: 'TextField 2',
          border: OutlineInputBorder(),
        ),
        enabled: isEnabled,
        readOnly: !isEnabled,
      );

  Widget buildFocusOne() => CommonButton(
        text: 'Focus TextField 1',
        onPressed: () => FocusScope.of(context).requestFocus(node1),
      );

  Widget buildFocusTwo() => CommonButton(
        text: 'Focus TextField 2',
        onPressed: () => FocusScope.of(context).requestFocus(node2),
      );

  Widget buildUnFocus() => CommonButton(
        text: 'Unfocus TextFields',
        onPressed: () => FocusScope.of(context).requestFocus(FocusNode()),
      );

  Widget buildEnableDisable() => CommonButton(
        text: 'Enable Disable',
        onPressed: () => setState(() => isEnabled = !isEnabled),
      );
}
