import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterlab/ui/sample/common_view_sample_page.dart';
import 'package:flutterlab/ui/sample/thread_worker_sample_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _buildGrid(),
        /*Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),*/
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }

  List<String> gridText = ['Common View', 'Thread Worker'];

  // #docregion grid
  Widget _buildGrid() => GridView.count(
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      children: _buildGridTileList(gridText.length));

  // The List.generate() constructor allows an easy way to create
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
            child: GestureDetector(
              onTap: () => handleGridTap(i),
              child: Center(
                child: Text(gridText[i],style: TextStyle(fontSize: 20),),
              ),
            ),
            padding: EdgeInsets.all(10.0),
            // 内边距
            margin: EdgeInsets.all(5.0),
            // 外边距
            decoration: BoxDecoration(
              //Container样式
              color: Color.fromARGB(255, Random().nextInt(255),
                  Random().nextInt(255), Random().nextInt(255)), // 背景色
              borderRadius: BorderRadius.circular(10.0), // 圆角边框
            ),
          ));

  handleGridTap(int i) {
    print("on tap i:" + i.toString());
    switch (i) {
      case 0:
        Navigator.of(context).push<void>(MaterialPageRoute(
            builder: (c) => CommonViewPage(title: "Common View")));
        break;
      case 1:
        Navigator.of(context).push<void>(MaterialPageRoute(
            builder: (c) => ThreadWorkerPage(title: "Thread Worker")));
        break;
    }
// #enddocregion grid
  }
}
