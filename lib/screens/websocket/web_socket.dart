import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_image.dart';
import 'package:flutter_demo/screens/custom_appbar/common_appbar.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyWebSocket extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect("wss://ws.ifelse.io/");

  MyWebSocket({Key? key}) : super(key: key);

  @override
  _MyWebSocketState createState() => _MyWebSocketState();
}

class _MyWebSocketState extends State<MyWebSocket> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Container(
        child: buildAppBar(),
      );

  Widget buildAppBar() => Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: const CommonAppBar(
          icon: AppImages.icCustomBack,
          title: 'WebSocket',
        ),
        body: buildSocketScreen(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.send),
          onPressed: sendData,
        ),
      );

  Widget buildSocketScreen() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Send any message to the server",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide(width: 1.5),
                  ),
                ),
                controller: controller,
              ),
            ),
          ),
          StreamBuilder(
            stream: widget.channel.stream,
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
              );
            },
          )
        ],
      );

  void sendData() {
    if (controller.text.isNotEmpty) {
      widget.channel.sink.add(controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
