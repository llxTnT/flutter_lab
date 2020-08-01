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
  Image assetsImg;

  String  dropdownValue="drop item1";

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
        body: SingleChildScrollView(
            child: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: assetsImg = Image.asset(
                      "assets/images/doge.jpg",
                      width: MediaQuery.of(context).size.width - 10,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      "https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png",
                      width: MediaQuery.of(context).size.width - 10,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: RaisedButton(
                        child: Text("Raised button"),
                        onPressed: () {
                          print("raised button on press");
                        },
                        textColor: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255)),
                        color: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255))),
                  )
                ],
              ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        child: FlatButton(
                            child: Text("Flat button"),
                            onPressed: handleFlatButtonPressed,
                            textColor: Color.fromARGB(255, Random().nextInt(255),
                                Random().nextInt(255), Random().nextInt(255)),
                            color: Color.fromARGB(255, Random().nextInt(255),
                                Random().nextInt(255), Random().nextInt(255))),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        child: DropdownButton<String>(
                            value:dropdownValue,
                          items: <String>[
                            "drop item1","drop item 2",
                            "drop item 3","drop item 4",
                            "drop item 5"].
                          map<DropdownMenuItem<String>>((String value)
                          {return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.deepPurple
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },),
                      )
                    ],
                  ),
            ])));
  }

  @override
  void dispose() {
    super.dispose();
  }

  handleFlatButtonPressed() {
    print("flatButton pressed");
  }
}
