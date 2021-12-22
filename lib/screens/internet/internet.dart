import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MyCheckInternet extends StatefulWidget {
  const MyCheckInternet({Key? key}) : super(key: key);

  @override
  _MyCheckInternetState createState() => _MyCheckInternetState();
}

class _MyCheckInternetState extends State<MyCheckInternet> with AppBase {
  late bool isConnected;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => buildAppBar();

  Widget buildAppBar() => Scaffold(
        backgroundColor: Colors.white,
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'CheckInternet',
        ),
        body: buildInternetScreen(),
      );

  Widget buildInternetScreen() => GestureDetector(
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
                  buildCheckInternet(),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildCheckInternet() => ElevatedButton(
        onPressed: () async {
          isConnected = await InternetConnectionChecker().hasConnection;
          showToast('Internet connection - ' + isConnected.toString());
        },
        child: const Text('Check Internet'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
        ),
      );
}
