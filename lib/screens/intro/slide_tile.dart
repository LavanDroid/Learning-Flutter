import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;

  const SlideTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => buildSlideTile();

  Widget buildSlideTile() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
            ),
          ],
        ),
      );
}
