import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_image.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, textYes, textNo;
  final bool isShowNo;
  final VoidCallback onYesPressed, onNoPressed;

  const CustomDialogBox({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.textYes,
    required this.textNo,
    required this.isShowNo,
    required this.onYesPressed,
    required this.onNoPressed,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 20.0, top: 45.0 + 20.0, right: 20.0, bottom: 20.0),
          margin: const EdgeInsets.only(top: 45.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widget.isShowNo,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: widget.onNoPressed,
                          child: Text(
                            widget.textNo,
                            style: const TextStyle(fontSize: 18),
                          )),
                    ),
                  ),
                  TextButton(
                      onPressed: widget.onYesPressed,
                      child: Text(
                        widget.textYes,
                        style: const TextStyle(fontSize: 18),
                      )),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45.0,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(45.0)),
                child: Image.asset(AppImages.icModel)),
          ),
        ),
      ],
    );
  }
}
