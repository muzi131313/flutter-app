import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _operation = 'No Gesture detected';

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState调用时，此方法会被再次调用
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // 定位
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have traced operation:',
            ),
            Text(
              '$_operation',
              style: Theme.of(context).textTheme.display1,
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200.0,
                  height: 100.0,
                  child: Text(
                    _operation,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => updateText("Tap"), //点击
                onDoubleTap: () => updateText("DoubleTap"), //双击
                onLongPress: () => updateText("LongPress"), //长按
              ),
            ),
          ],
        ),
      ),
    );
  }
}
