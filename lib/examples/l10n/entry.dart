import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'i10n/localization_intl.dart';
import 'views/LoginPage.dart';

import 'actions.dart';

bool counterReducer(bool state, dynamic action) {
  if (action == MyActions.ChangeLanguage) {
    return !state;
  }

  return state;
}

void appl10nInit() {
  final store = Store<bool>(counterReducer, initialState: false);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<bool> store;

  MyApp({Key key, this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<bool>(
      store: store,
      child: MaterialApp(
        // title: 'Flutter Demo',
        // onGenerateTitle: (BuildContext context) =>
        //     DemoLocalizations.of(context).title,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          const DemoLocalizationsDelegate(),
        ],
        supportedLocales: [
          const Locale('zh', 'CN'), // 中文简体`
          const Locale('en', 'US'), // 美国英语
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // locale: Locale('zh', 'CN'),
        // ? Locale('en', 'US') : Locale('zh', 'CN'),
        // locale: store.state.locale,
        home: LoginPage(),
      ),
    );
  }
}
