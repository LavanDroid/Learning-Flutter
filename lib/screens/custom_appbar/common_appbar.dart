import 'package:flutter/material.dart';
//import 'package:flutter_demo/appbase/app_extension.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const BaseAppBar({Key? key}) : super(key: key);
  final Color? bgColor;
  final Color? textIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final String? whereFrom;
  //var appPrint = AppPrint();

  const CommonAppBar({
    Key? key,
    this.bgColor = const Color(0xff6200ee),
    this.textIconColor = Colors.white,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height = kToolbarHeight,
    this.hideBack = false,
    this.whereFrom = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: menuItem,
      toolbarHeight: preferredSize.height,
      iconTheme: IconThemeData(color: textIconColor),
      leading: hideBack
          ? Container()
          : icon == null
              ? const BackButton()
              : IconButton(
                  onPressed: () {
                    if (whereFrom != null &&
                        'Veera'.toLowerCase() == whereFrom?.toLowerCase()) {
                      showToast(context, 'Button Back Arrow Locked');
                    } else {
                      Navigator.pop(context, true);
                    }
                  },
                  icon: Image.asset(
                    icon!,
                    height: 18.0,
                    width: 18.0,
                  )),
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: textIconColor),
      ),
      backgroundColor: bgColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);

  void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
      // padding: const EdgeInsets.all(20.0),
      backgroundColor: Colors.teal,
      //behavior: SnackBarBehavior.floating,
      //margin: const EdgeInsets.only(bottom: 250.0, left: 25.0, right: 25.0),
    ));
  }
}
