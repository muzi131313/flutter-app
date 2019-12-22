import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void appRouterInit() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => MyHomePage(text: 'First APP'),
        "new_page": (context) {
          return NewRoute(
            text: ModalRoute.of(context).settings.arguments,
          );
        },
      },
      initialRoute: "/",
    );
  }
}

class NewRoute extends StatelessWidget {
  // 接收参数
  NewRoute({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  // 生成随机字符串
  final wordPair = new WordPair.random();

  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    // var text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(children: <Widget>[
            Text("This is new route"),
            Text(text),
            Text(wordPair.toString()),
            RaisedButton(
              // 回传给上一个页面参数
              onPressed: () => Navigator.pop(context, "我是返回值"),
              child: Text("返回"),
            )
          ]),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(text),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
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
              'hello',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              // child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () async {
                //导航到新路由
                // var result = await Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return NewRoute(
                //         // 传入路由参数
                //         text: "我是新对象",
                //       );
                //     },
                //   ),
                // );
                // 使用路由名称加载新路由
                var result = await Navigator.pushNamed(
                  context,
                  "new_page",
                  arguments: "我是新对象",
                );
                // 拿到路由返回的值
                print("路由的值: $result");
              },
              child: Text("打开提示页"),
            ),
          ],
        ),
      ),
    );
  }
}
