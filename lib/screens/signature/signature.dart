import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_app_bar/common_app_bar.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MySignature extends StatefulWidget {
  const MySignature({Key? key}) : super(key: key);

  @override
  _MySignatureState createState() => _MySignatureState();
}

class _MySignatureState extends State<MySignature> with AppBase {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  Widget build(BuildContext context) => buildView();

  Widget buildView() => Scaffold(
      appBar: const CommonAppBar(
        icon: AppImages.icCustomBack,
        title: 'Signature',
      ),
      body: GestureDetector(
        onTap: () => hideKeyBoard(),
        child: SafeArea(
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: SfSignaturePad(
                        key: signatureGlobalKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 1.0,
                        maximumStrokeWidth: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(children: <Widget>[
                  TextButton(
                    child: const Text('ToImage'),
                    onPressed: _handleSaveButtonPressed,
                  ),
                  TextButton(
                    child: const Text('Clear'),
                    onPressed: _handleClearButtonPressed,
                  )
                ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center),
        ),
      ));

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(
                color: Colors.grey[300],
                child: Image.memory(bytes!.buffer.asUint8List()),
              ),
            ),
          );
        },
      ),
    );
  }
}
