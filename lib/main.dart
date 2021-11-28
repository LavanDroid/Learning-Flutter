import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base/app_base.dart';
import 'constants/app_constants.dart';
import 'routes/route_generator.dart';

void main() {
  // runApp(const MyApp());
  runApp(const MyDemo());

  // ? Force to portrait mode //
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyDemo()));
}

/* class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Text('Veera App'),
    );
  }
} */

class MyDemo extends StatefulWidget {
  const MyDemo({Key? key}) : super(key: key);

  @override
  _MyDemoState createState() => _MyDemoState();
}

class _MyDemoState extends State<MyDemo> with AppBase {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Veera Flutter',
      //debugShowCheckedModeBanner: false,
      initialRoute: AppConstants.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
