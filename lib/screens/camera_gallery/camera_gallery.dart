import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:image_picker/image_picker.dart';

class MyCameraGallery extends StatefulWidget {
  const MyCameraGallery({Key? key}) : super(key: key);

  @override
  _MyCameraGalleryState createState() => _MyCameraGalleryState();
}

class _MyCameraGalleryState extends State<MyCameraGallery> with AppBase {
  File? imageFile;
  bool isLoadImage = false;

  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'Camera & Gallery',
        ),
        body: buildScreen(),
      );

  Widget buildScreen() => SafeArea(
        child: GestureDetector(
          onTap: () => hideKeyBoard(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Spacer(),
                isLoadImage
                    ? ClipOval(
                        child: Image.file(
                          imageFile!,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const FlutterLogo(size: 160.0),
                const SizedBox(height: 24.0),
                buildText(),
                const SizedBox(height: 48.0),
                buildButton(
                  title: 'Camera',
                  icon: Icons.camera_alt_outlined,
                  onClicked: () => pickImage(ImageSource.camera),
                ),
                const SizedBox(height: 24.0),
                buildButton(
                  title: 'Gallery',
                  icon: Icons.image_outlined,
                  onClicked: () => pickImage(ImageSource.gallery),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      );

  Widget buildText() => const Text(
        'Image Picker',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 48.0,
        ),
      );

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(55.0),
          textStyle: const TextStyle(fontSize: 20.0),
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
        onPressed: onClicked,
        label: Text(title),
        icon: Icon(icon),
      );

  Future pickImage(ImageSource mSource) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: mSource);
      setState(() {
        if (pickedFile?.path != null) {
          imageFile = File(pickedFile!.path);
          isLoadImage = true;
        }
      });
    } on Exception catch (e) {
      appPrint('Exception to pick image: $e');
    }
  }
}
