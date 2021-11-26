import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/appbase/app_base.dart';
import 'package:flutter_demo/appbase/app_string.dart';
import 'package:flutter_demo/model/main_model.dart';
import 'package:flutter_demo/screens/buttons/my_button.dart';
import 'package:flutter_demo/screens/check_box/my_check_box.dart';
import 'package:flutter_demo/screens/custom_appbar/my_appbar.dart';
import 'package:flutter_demo/screens/dialog/my_dialog.dart';
import 'package:flutter_demo/screens/listview/my_listview.dart';
import 'package:flutter_demo/screens/radio_button/my_radio.dart';
import 'package:flutter_demo/screens/switch_button/my_switch.dart';
import 'package:flutter_demo/screens/textfield/my_textfield.dart';
import 'package:flutter_demo/screens/textview/my_textview.dart';
import 'package:flutter_demo/screens/toggle_button/my_toggle.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  //late var appPrint;
  //late List<String> mListview;
  late List<MainModel> mListview; // = [MainModel.dummy()];
  late BuildContext mContext;

  @override
  void initState() {
    super.initState();
    //appPrint = AppPrint();
    mListview = CatalogModel.items;
    //mListview.sort();
    mListview.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veera Flutter',
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        //? Hide the soft keyboard by clicking outside of TextField or anywhere on the screen
        onTap: () => hideKeyBoard(),
        child: Scaffold(
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
          body: SafeArea(
            child: Column(
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
                              title: Text(item.name),
                              trailing: const Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //showSnake(context, item.name, idx);
                                checkNextAction(item);
                              },
                            ),
                            color: Colors.greenAccent,
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnake(BuildContext context, String name, int idx) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Clicked Item: $name -> $idx'),
      duration: const Duration(seconds: 2),
    ));
  }

// ? Depends on list name move to the specify the screen
  void checkNextAction(MainModel item) {
    switch (item.id) {
      case 1:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyButtons()));
          //nextAction(const MyButtons());
          break;
        }
      case 2:
        {
          Fluttertoast.showToast(
              msg: "This is my toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 18.0);
          break;
        }
      case 3:
        {
          // Navigator.push(mContext,MaterialPageRoute(builder: (mContext) => const MyDialog()));
          nextAction(() => const MyDialog());
          break;
        }
      case 4:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyAppBar()));
          //nextAction(const MyAppBar());
          break;
        }
      case 5:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyTextView()));
          break;
        }
      case 6:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyTextField()));
          break;
        }
      case 7:
        {
          nextAction(() => const MyListView());
          break;
        }
      case 10:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyRadioButton()));
          break;
        }
      case 11:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MySwitchButton()));
          break;
        }
      case 12:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyToggleButton()));
          break;
        }
      case 13:
        {
          Navigator.push(mContext,
              MaterialPageRoute(builder: (mContext) => const MyCheckBox()));
          break;
        }
      default:
        {
          appPrint("Yet to create $item.name screen");
        }
    }
  }

  void nextAction(Widget Function() pages) {
    Navigator.push(
      mContext,
      MaterialPageRoute(builder: (mContext) => pages()),
    );
  }
}
