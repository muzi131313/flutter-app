import 'package:flutter/material.dart';

import 'modules/drag.dart';
import 'modules/eventType.dart';

void appEventInit(String type) {
  runApp(MyApp(type: type));
}

class MyApp extends StatelessWidget {
  final String type;

  MyApp({Key key, this.type}) : super(key: key);

  // 获取 home 页面
  StatefulWidget getHomePage() {
    switch (type) {
      case 'drag':
        return Drag();
      case 'eventType':
        return MyHomePage(title: 'First APP');
    }
    return null;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: getHomePage(),
      ),
      // 原始事件记录
      onPointerDown: (PointerDownEvent event) {
        print(event);
      },
    );
  }
}
