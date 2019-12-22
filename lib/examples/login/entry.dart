import 'package:flutter/material.dart';

void appLoginInit() {
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
    return new Scaffold(
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('click Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('click search button');
              }),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('click filter button');
            },
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/images/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE')
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () {},
              )
            ]),
          ],
        ),
      ),
    );
  }
}
