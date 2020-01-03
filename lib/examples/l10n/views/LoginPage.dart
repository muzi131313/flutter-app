import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../i10n/localization_intl.dart';
import '../actions.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<StatefulWidget> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
        // title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('click Menu button');
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Text(DemoLocalizations.of(context).title),
            SizedBox(
              height: 20.0,
            ),
            StoreConnector<bool, VoidCallback>(
              converter: (store) {
                // Return a `VoidCallback`, which is a fancy name for a function
                // with no parameters. It only dispatches an Increment action.
                return () => store.dispatch(MyActions.ChangeLanguage);
              },
              builder: (context, callback) {
                return RaisedButton(
                  child: Text('change language'),
                  onPressed: callback,
                );
              },
            ),
            SizedBox(
              height: 20.0,
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
