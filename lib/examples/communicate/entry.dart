import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'package:batterylevel/batterylevel.dart';

void communicateInit() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'First APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  String _platformVersion = 'Unknown platform version.';

  Future<Null> _getBatteryLevel() async {
    String platformVersion = await Batterylevel.platformVersion;
    String batteryLevel = await Batterylevel.batteryLevel;

    setState(() {
      _batteryLevel = batteryLevel;
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_batteryLevel),
            Text(_platformVersion),
            new RaisedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
          ],
        ),
      ),
    );
  }
}
