import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'builder_model.dart';

class MyItemWidget extends StatelessWidget {
  final BuilderModel item;
  final VoidCallback onTap;

  const MyItemWidget({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: CircleAvatar(
        //   // backgroundImage: AssetImage(images[index]),
        //   backgroundImage: NetworkImage(item.img),
        //   /* child: ClipOval(
        //     child: Image.network(
        //       item.img,
        //       width: 45.0,
        //       height: 45.0,
        //       fit: BoxFit.cover,
        //     ),
        //   ), */
        // ),
        /* leading: CachedNetworkImage(
          imageUrl: item.img,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ), */
        leading: CachedNetworkImage(
          imageUrl: item.img,
          imageBuilder: (context, imageProvider) => Container(
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.all(5),
            child: const CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(item.name),
        subtitle: const Text('This is subtitle'),
        onTap: onTap,
      ),
    );
  }
}
