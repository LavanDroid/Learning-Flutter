import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_constants.dart';
import 'package:flutter_demo/constants/app_route.dart';
import 'package:flutter_demo/home/home.dart';
import 'package:flutter_demo/model/bundle.dart';
import 'package:flutter_demo/screens/buttons/my_button.dart';
import 'package:flutter_demo/screens/camera_gallery/camera_gallery.dart';
import 'package:flutter_demo/screens/check_box/my_check_box.dart';
import 'package:flutter_demo/screens/custom_app_bar/my_app_bar.dart';
import 'package:flutter_demo/screens/date_time_picker/my_date_time.dart';
import 'package:flutter_demo/screens/dialog/my_dialog.dart';
import 'package:flutter_demo/screens/dropdown/my_dropdown.dart';
import 'package:flutter_demo/screens/expansion_tile/expansion_tile.dart';
import 'package:flutter_demo/screens/internet/internet.dart';
import 'package:flutter_demo/screens/intro/intro.dart';
import 'package:flutter_demo/screens/listview/my_listview.dart';
import 'package:flutter_demo/screens/location/location.dart';
import 'package:flutter_demo/screens/navigation_drawer/my_drawer.dart';
import 'package:flutter_demo/screens/navigation_drawer/normal/pages/drawer_home.dart';
import 'package:flutter_demo/screens/navigation_drawer/normal/pages/drawer_contact.dart';
import 'package:flutter_demo/screens/navigation_drawer/normal/pages/drawer_event.dart';
import 'package:flutter_demo/screens/navigation_drawer/normal/pages/drawer_notification.dart';
import 'package:flutter_demo/screens/navigation_drawer/normal/pages/drawer_profile.dart';
import 'package:flutter_demo/screens/popup_menu/my_popup_menu.dart';
import 'package:flutter_demo/screens/radio_button/my_radio.dart';
import 'package:flutter_demo/screens/signature/signature.dart';
import 'package:flutter_demo/screens/slider/my_slider.dart';
import 'package:flutter_demo/screens/splash/splash.dart';
import 'package:flutter_demo/screens/switch_button/my_switch.dart';
import 'package:flutter_demo/screens/text_field/my_text_field.dart';
import 'package:flutter_demo/screens/text_view/my_text_view.dart';
import 'package:flutter_demo/screens/toggle_button/my_toggle.dart';
import 'package:flutter_demo/screens/websocket/web_socket.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    final args = settings.arguments;

    if (!AppConstants.inProduction) {
      // ignore: avoid_print
      print('Current page : ${settings.name}');
    }

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          //builder: (_) => const DummyHomePage2(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );

      case AppRoutes.appBar:
        return MaterialPageRoute(
          builder: (_) => const MyAppBar(),
        );

      case AppRoutes.button:
        /* if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyButtons(
              data: args,
            ),
          );
        } */
        return MaterialPageRoute(
          builder: (_) => MyButtons(
            appBundle: args as AppBundle,
          ),
        );

      case AppRoutes.radioButton:
        return MaterialPageRoute(
          builder: (_) => const MyRadioButton(),
        );

      case AppRoutes.switchButton:
        return MaterialPageRoute(
          builder: (_) => const MySwitchButton(),
        );

      case AppRoutes.toggleButton:
        return MaterialPageRoute(
          builder: (_) => const MyToggleButton(),
        );

      case AppRoutes.checkBox:
        return MaterialPageRoute(
          builder: (_) => const MyCheckBox(),
        );

      case AppRoutes.dialog:
        return MaterialPageRoute(
          builder: (_) => const MyDialog(),
        );

      case AppRoutes.listView:
        return MaterialPageRoute(
          builder: (_) => const MyListView(),
        );

      case AppRoutes.dropdown:
        return MaterialPageRoute(
          builder: (_) => const MyDropDown(),
        );

      case AppRoutes.popupMenu:
        return MaterialPageRoute(
          builder: (_) => const MyPopupMenu(),
        );

      case AppRoutes.textField:
        return MaterialPageRoute(
          builder: (_) => const MyTextField(),
        );

      case AppRoutes.textView:
        return MaterialPageRoute(
          builder: (_) => const MyTextView(),
        );

      case AppRoutes.expansionTile:
        return MaterialPageRoute(
          builder: (_) => const MyExpansionTile(),
        );

      case AppRoutes.slider:
        return MaterialPageRoute(
          builder: (_) => const MySlider(),
        );

      case AppRoutes.introduction:
        return MaterialPageRoute(
          builder: (_) => const MyIntroduction(),
        );

      case AppRoutes.signature:
        return MaterialPageRoute(
          builder: (_) => const MySignature(),
        );

      case AppRoutes.dateTimePicker:
        return MaterialPageRoute(
          builder: (_) => const MyDateAndTime(),
        );

      case AppRoutes.cameraGallery:
        return MaterialPageRoute(
          builder: (_) => const MyCameraGallery(),
        );

      case AppRoutes.myDrawer:
        return MaterialPageRoute(
          builder: (_) => const MyDrawer(),
        );

      case AppRoutes.drawerHome:
        return MaterialPageRoute(
          builder: (_) => const DrawerHome(),
        );

      case AppRoutes.drawerProfile:
        return MaterialPageRoute(
          builder: (_) => const DrawerProfile(),
        );

      case AppRoutes.drawerContact:
        return MaterialPageRoute(
          builder: (_) => const DrawerContact(),
        );

      case AppRoutes.drawerEvent:
        return MaterialPageRoute(
          builder: (_) => const DrawerEvent(),
        );

      case AppRoutes.drawerNotification:
        return MaterialPageRoute(
          builder: (_) => const DrawerNotification(),
        );

      case AppRoutes.websocket:
        return MaterialPageRoute(
          builder: (_) => MyWebSocket(),
        );

      case AppRoutes.checkInternet:
        return MaterialPageRoute(
          builder: (_) => const MyCheckInternet(),
        );

      case AppRoutes.location:
        return MaterialPageRoute(
          builder: (_) => const MyLocation(),
        );

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  //! Validation of correct data type
  /* case AppRoutes.button:{
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
