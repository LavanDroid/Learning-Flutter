import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key}) : super(key: key);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> with AppBase {
  static final mDropList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  // String mValue = mDropList.first.toString();
  String? mValue;
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
            title: 'Dropdown',
          ),
          body: buildDropDownScreen(),
        ),
      );

  Widget buildDropDownScreen() => GestureDetector(
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
                  buildDefault(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildDefault() => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 2,
            )),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: const Text('Pickup on item'),
            dropdownColor: Colors.yellow,
            value: mValue, // currently selected item
            items: mDropList.map(buildMenuItem).toList(),
            onChanged: (String? value) {
              setState(() => mValue = value!);
            },
            isExpanded: true, // max width
            iconSize: 36.0,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black87,
            ),

            //? can use this
            /* style: const TextStyle(
              color: Colors.green,
            ), */

            //! not working -> text is very small
            /* selectedItemBuilder: (BuildContext context) {
              return mDropList.map((String value) {
                return Text(
                  mValue,
                  style: const TextStyle(color: Colors.pink),
                );
              }).toList();
            }, */
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: mValue == item ? Colors.red : Colors.black87,
          ),
        ),
      );
}
