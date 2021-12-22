import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';

class TextFieldBorder extends StatefulWidget {
  const TextFieldBorder({Key? key}) : super(key: key);

  @override
  _TextFieldBorderState createState() => _TextFieldBorderState();
}

class _TextFieldBorderState extends State<TextFieldBorder> with AppBase {
  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        //? Hide the soft keyboard by clicking outside of TextField or anywhere on the screen
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: AppColors.grey,
          body: _wBorderScreen(),
        ),
      );

  Widget _wBorderScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildText('No Border'),
                buildNoBorder(),
                buildText('Underline'),
                buildUnderline(),
                buildText('Outline Square'),
                buildOutlineSquare(),
                buildText('Outline Rounded'),
                buildOutlineRounded(),
                buildText('shadow'),
                buildShadow(),
                // buildText('Beveled'),
                // buildBeveled(),
                const SizedBox(height: 500.0),
              ],
            ),
          ),
        ),
      );

  Widget buildText(String text) => Container(
        margin: const EdgeInsets.fromLTRB(0, 25, 0, 8),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      );

  Widget buildNoBorder() => TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      );

  buildUnderline() => TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
        ),
      );

  buildOutlineSquare() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      );

  buildOutlineRounded() => TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.green, width: 3),
          ),
        ),
      );

  buildShadow() => Container(
        child: TextFormField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            /* enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.green, width: 3),
            ), */
          ),
        ),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.purple,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ]),
      );

  /* buildBeveled() => TextField(
        decoration: InputDecoration(
          enabledBorder: CutCornersBorder(
            borderSide: const BorderSide(color: Colors.black, width: 3),
          ),
          focusedBorder: CutCornersBorder(
            borderSide: const BorderSide(color: Colors.green, width: 3),
          ),
        ),
      ); */
}
