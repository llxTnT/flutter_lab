import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class ThreadWorkerPage extends StatefulWidget {
  ThreadWorkerPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ThreadWorkerPageState createState() => _ThreadWorkerPageState();
}

class _ThreadWorkerPageState extends State<ThreadWorkerPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      child: RaisedButton(
                        child: Text("Simple Thread Futrue"),
                        onPressed: handleSimpleThreadBTNPressed,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(5),
                      child: RaisedButton(
                        child: Text("Multi Thread Futrue"),
                        onPressed: handleMultiThreadBTNPressed,
                      ))
                ],
              ),
            ]));
  }

  void handleSimpleThreadBTNPressed() {
    print("simple thread pressed");
    Future future = new Future(() {
      print("when future do in this");
    });
    future.then((value) => 1);
  }

  void handleMultiThreadBTNPressed() {
    print("Multi thread pressed");
    Future future1 = new Future(() {
      print("when future 1 start do in this");
      sleep(Duration(milliseconds: 300));
      print("when future 1 end do in this");
    });
    Future future2 = new Future(() {
      print("when future 2 start do in this");
      sleep(Duration(milliseconds: 400));
      print("when future 2 end do in this");
    });
    Future future3 = new Future(() {
      print("when future 3 start do in this");
      sleep(Duration(milliseconds: 500));
      print("when future 3 end do in this");
    });
    future1.then((value) => 1);
    future3.then((value) => 2);
    future2.then((value) => 3);
    Future.microtask((){
      print("when micro task start do");
    }).then((value) => 4);
  }
}
