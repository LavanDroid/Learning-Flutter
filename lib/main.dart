import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/appbase/app_string.dart';
import 'package:flutter_demo/buttons/my_button.dart';
import 'package:flutter_demo/custom_appbar/my_appbar.dart';

void main() {
  // runApp(const MyApp());
  runApp(const MyDemo());

  // ? Force to portrait mode //
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(
            const MyDemo(),
          ));
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
  //late var appPrint;
  late List<String> mListview;
  late BuildContext mContext;

  @override
  void initState() {
    super.initState();
    //appPrint = AppPrint();
    mListview = [
      "Button",
      "Toast",
      "Dialog",
      "AppBar",
      "Textview",
      "Edittext",
      "ListView",
      "DropDown",
      "PopMenu"
    ];
    mListview.sort();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veera Flutter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.welcomeMessage),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // ignore: avoid_print
              print('Clicked Menu');
            },
          ),
          // automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('Clicked Search ' + AppStrings.welcomeMessage);
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('Clicked More');
                  // appPrint('inProduction Mode : $inProduction');
                  appPrint('inProduction Mode');
                },
                icon: const Icon(Icons.more_vert))
          ],
          flexibleSpace: SafeArea(
            child: Icon(
              Icons.camera,
              size: 55.0,
              color: appColor.mBlue,
              // color: Colors.red.withOpacity(1),
              //color: Color.fromRGBO(252, 186, 3, 0.5),
              // color: Color(0xffffffff),
            ),
            /* child: Center(
              child: Text(
                'Veera',
                style: TextStyle(fontSize: 24.0),
              ),
            ), */
          ),
          bottom: PreferredSize(
              child: Container(
                color: Colors.blueGrey,
                height: 75.0,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Flutter Demo',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: appColor.mYellow,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              preferredSize: const Size.fromHeight(75.0)),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: mListview.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int idx) {
                      mContext = context;
                      final item = mListview[idx];
                      return Card(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text(item),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            showToast(context, item, idx);
                            checkNextAction(item);
                          },
                        ),
                        color: Colors.greenAccent,
                      );
                    }))
          ],
        ),
      ),
    );
  }

  @override
  void myVeeraMethod() {
    //? implement myVeeraMethod
  }

  void showToast(BuildContext context, String name, int idx) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Clicked Item: $name -> $idx'),
      duration: const Duration(seconds: 2),
    ));
  }

// ? Depends on list name move to the specify the screen
  void checkNextAction(String name) {
    switch (name) {
      case "Button":
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyButtons()));
          // nextAction(const MyButtons());
          break;
        }
      case "AppBar":
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyAppBar()));
          //nextAction(const MyAppBar());
          break;
        }
      default:
        {
          appPrint("Yet to create $name screen");
        }
    }
  }

  /* void nextAction(MyButtons screen) {
    Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyButtons()));
  } */
}
