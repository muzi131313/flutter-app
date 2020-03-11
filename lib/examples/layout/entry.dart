import 'package:flutter/material.dart';

void layoutInit() {
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
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          height: size.height + 100,
          width: size.width,
          child: Stack(children: <Widget>[
            // Container(
            //   height: size.height + 100,
            //   width: size.width,
            //   child: Text('123444'),
            // ),
            Align(
              alignment: Alignment(0, -1),
              child: FlutterLogo(
                size: 30,
              ),
            ),
            Align(
              alignment: Alignment(0.2, 0.5),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ])),
    );
  }
}
