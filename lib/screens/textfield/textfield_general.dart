import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/constants/app_colors.dart';

class TextFieldGeneral extends StatefulWidget {
  const TextFieldGeneral({Key? key}) : super(key: key);

  @override
  _TextFieldGeneralState createState() => _TextFieldGeneralState();
}

class _TextFieldGeneralState extends State<TextFieldGeneral> with AppBase {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //String password = '';
  bool isPasswordVisible = true;
  final numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: _wAppBar(),
      );

  Widget _wAppBar() => GestureDetector(
        //? Hide the soft keyboard by clicking outside of TextField or anywhere on the screen
        onTap: () => hideKeyBoard(),
        child: Scaffold(
          backgroundColor: AppColors.grey,
          body: _wGeneralScreen(),
        ),
      );

  Widget _wGeneralScreen() => SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50.0),
                  buildEmail(),
                  const SizedBox(height: 25.0),
                  buildPassword(),
                  const SizedBox(height: 50.0),
                  buildSubmitButton(),
                  const SizedBox(height: 25.0),
                  buildNumber(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () {
          appPrint('Email: ${emailController.text}');
          appPrint('Password: ${passwordController.text}');
          appPrint('Number: ${numberController.text}');
        },
        child: const Text('Submit'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(55.0),
          textStyle: const TextStyle(fontSize: 28.0),
          primary: Colors.orange,
          onPrimary: Colors.black,
        ),
      );

  Widget buildEmail() => TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'name@example.com',
          labelText: 'Email',
          prefixIcon: const Icon(Icons.mail),
          // icon: Icon(Icons.mail),
          suffixIcon: emailController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => emailController.clear(),
                ),
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        validator: (value) => validateEmail(emailController.text),
        // autofocus: true,
      );

  Widget buildPassword() => TextFormField(
        //onChanged: (value) => setState(() => password = value),
        controller: passwordController,
        //onFieldSubmitted: (value) => setState(() => password = value),
        decoration: InputDecoration(
          hintText: 'Your Password...',
          labelText: 'Password',
          //errorText: 'Password is wrong',
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        obscureText: isPasswordVisible,
        validator: (value) => validatePassword(passwordController.text),
      );

  Widget buildNumber() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mobile Number',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: numberController,
            decoration: InputDecoration(
              hintText: 'Enter number...',
              hintStyle: const TextStyle(color: Colors.black54),
              filled: true,
              fillColor: Colors.lime[200],
              border: const OutlineInputBorder(),
            ),
            style: const TextStyle(color: Colors.green),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: (value) => validateMobile(numberController.text),
          ),
        ],
      );
}
