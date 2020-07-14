import 'dart:math';

import 'package:flutter/material.dart';

class CommonViewPage extends StatefulWidget {
  CommonViewPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CommonViewPageState createState() => _CommonViewPageState();
}

class _CommonViewPageState extends State<CommonViewPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Im Text View 1 NormalText"),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    "Im Text View 2 Big Text",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Im ',
                          style: TextStyle(
                              color: Color.fromARGB(
                                  255,
                                  Random().nextInt(255),
                                  Random().nextInt(255),
                                  Random().nextInt(255)))),
                      //第1个片段，红色样式
                      TextSpan(
                          text: 'Text ',
                          style: TextStyle(
                              color: Color.fromARGB(
                                  255,
                                  Random().nextInt(255),
                                  Random().nextInt(255),
                                  Random().nextInt(255)))),
                      //第1个片段，黑色样式
                      TextSpan(
                          text: 'View 3 ',
                          style: TextStyle(
                              color: Color.fromARGB(
                                  255,
                                  Random().nextInt(255),
                                  Random().nextInt(255),
                                  Random().nextInt(255)))),
                      //第1个片段，红色样式
                      TextSpan(
                          text: 'Color Text',
                          style: TextStyle(
                              color: Color.fromARGB(
                                  255,
                                  Random().nextInt(255),
                                  Random().nextInt(255),
                                  Random().nextInt(255))))
                      //第1个片段，黑色样式
                    ]),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
