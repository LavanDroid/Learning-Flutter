import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_constants.dart';
import 'package:flutter_demo/home/home.dart';
import 'package:flutter_demo/screens/buttons/my_button.dart';
import 'package:flutter_demo/screens/check_box/my_check_box.dart';
import 'package:flutter_demo/screens/custom_appbar/my_appbar.dart';
import 'package:flutter_demo/screens/dialog/my_dialog.dart';
import 'package:flutter_demo/screens/dropdown/my_dropdown.dart';
import 'package:flutter_demo/screens/expansion_tile/expansion_tile.dart';
import 'package:flutter_demo/screens/listview/my_listview.dart';
import 'package:flutter_demo/screens/popup_menu/my_popup_menu.dart';
import 'package:flutter_demo/screens/radio_button/my_radio.dart';
import 'package:flutter_demo/screens/slider/my_slider.dart';
import 'package:flutter_demo/screens/splash/splash.dart';
import 'package:flutter_demo/screens/switch_button/my_switch.dart';
import 'package:flutter_demo/screens/textfield/my_textfield.dart';
import 'package:flutter_demo/screens/textview/my_textview.dart';
import 'package:flutter_demo/screens/toggle_button/my_toggle.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    final args = settings.arguments;

    if (!AppConstants.inProduction) {
      // ignore: avoid_print
      print('Current page : ${settings.name}');
    }

    switch (settings.name) {
      case AppConstants.spalsh:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case AppConstants.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );

      case AppConstants.appBar:
        return MaterialPageRoute(
          builder: (_) => const MyAppBar(),
        );

      case AppConstants.button:
        /* if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyButtons(
              data: args,
            ),
          );
        } */
        return MaterialPageRoute(
          builder: (_) => MyButtons(
            data: args as String,
          ),
        );

      case AppConstants.radioButton:
        return MaterialPageRoute(
          builder: (_) => const MyRadioButton(),
        );

      case AppConstants.switchButton:
        return MaterialPageRoute(
          builder: (_) => const MySwitchButton(),
        );

      case AppConstants.toggleButton:
        return MaterialPageRoute(
          builder: (_) => const MyToggleButton(),
        );

      case AppConstants.checkBox:
        return MaterialPageRoute(
          builder: (_) => const MyCheckBox(),
        );

      case AppConstants.dialog:
        return MaterialPageRoute(
          builder: (_) => const MyDialog(),
        );

      case AppConstants.listview:
        return MaterialPageRoute(
          builder: (_) => const MyListView(),
        );

      case AppConstants.dropdown:
        return MaterialPageRoute(
          builder: (_) => const MyDropDown(),
        );

      case AppConstants.popupMenu:
        return MaterialPageRoute(
          builder: (_) => const MyPopupMenu(),
        );

      case AppConstants.textField:
        return MaterialPageRoute(
          builder: (_) => const MyTextField(),
        );

      case AppConstants.textview:
        return MaterialPageRoute(
          builder: (_) => const MyTextView(),
        );

      case AppConstants.expansionTile:
        return MaterialPageRoute(
          builder: (_) => const MyExpansionTile(),
        );

        case AppConstants.slider:
        return MaterialPageRoute(
          builder: (_) => const MySlider(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  //! Validation of correct data type
  /* case AppConstants.button:{
        //? Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyButtons(
                  data: args,
                ),
          );
        } 
        //? If args is not of the correct type, return an error page.
        //? You can also throw an exception while in development.
        return _errorRoute(); 
        }*/

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR ROUTE'),
          ),
        );
      },
    );
  }
}
