import 'package:flutter/material.dart';
import 'package:flutter_demo/base/app_base.dart';
import 'package:flutter_demo/base/app_string.dart';
import 'package:flutter_demo/constants/app_constants.dart';
import 'package:flutter_demo/model/main_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AppBase {
  late List<MainModel> mListview;

  @override
  void initState() {
    super.initState();
    mListview = CatalogModel.items;
    //mListview.sort();
    mListview.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) => buildHome();

  Widget buildHome() => GestureDetector(
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
              preferredSize: const Size.fromHeight(75.0),
            ),
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
                      final item = mListview[idx];
                      return Card(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text(item.name),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //showSnake(context, item.name, idx);
                            checkNextAction(context, item);
                          },
                        ),
                        color: Colors.greenAccent,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );

  void showSnake(BuildContext context, String name, int idx) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Clicked Item: $name -> $idx'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void checkNextAction(BuildContext mContext, MainModel item) {
    switch (item.id) {
      case 1: //Button
        {
          navigateTo(mContext, AppConstants.button,
              data: 'Data from home \u265A');
          break;
        }
      case 2: // Toast
        {
          Fluttertoast.showToast(
              msg: "This is my toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              //timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 18.0);
          break;
        }
      case 3: // Dialog
        {
          navigateTo(mContext, AppConstants.dialog);
          break;
        }
      case 4: //AppBar
        {
          navigateTo(mContext, AppConstants.appBar);
          break;
        }
      case 5: //TextView
        {
          navigateTo(mContext, AppConstants.textview);
          break;
        }
      case 6: //TextField
        {
          navigateTo(mContext, AppConstants.textField);
          break;
        }
      case 7: //ListView
        {
          navigateTo(mContext, AppConstants.listview);
          break;
        }
      case 8: //Dropdowm
        {
          navigateTo(mContext, AppConstants.dropdown);
          break;
        }
      case 9: //Popup Menu
        {
          navigateTo(mContext, AppConstants.popupMenu);
          break;
        }
      case 10: //Radio Button
        {
          navigateTo(mContext, AppConstants.radioButton);
          break;
        }
      case 11: //Switch Button
        {
          navigateTo(mContext, AppConstants.switchButton);
          break;
        }
      case 12: //Toggle Button
        {
          navigateTo(mContext, AppConstants.toggleButton);
          break;
        }
      case 13: // Check Box
        {
          navigateTo(mContext, AppConstants.checkBox);
          break;
        }
      case 14: // Expansion Tile
        {
          navigateTo(mContext, AppConstants.expansionTile);
          break;
        }
      case 15: // Slider (SeekBar)
        {
          navigateTo(mContext, AppConstants.slider);
          break;
        }
      default:
        {
          appPrint(
            'Yet to create ' + item.name + ' & ID-> ' + item.id.toString(),
          );
        }
    }
  }

  /* void nextAction(BuildContext mContext, Widget Function() pages) {
    Navigator.push(
      mContext,
      MaterialPageRoute(
        builder: (mContext) => pages(),
      ),
    );
  } */
  /* void nextAction(BuildContext mContext, String routePage, {String data = ''}) {
    if (data.isNotEmpty) {
      Navigator.pushNamed(mContext, routePage, arguments: data);
    } else {
      Navigator.pushNamed(mContext, routePage);
    }
  } */
}
