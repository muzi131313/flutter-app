import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// One simple action: Increment
enum Actions {
  Increment,
  Decrement,
}

// redux: state
class CountState {
  int count;
  CountState.initState() : count = 0;
}

// redux: reducer
CountState counterReducer(CountState state, dynamic action) {
  if (action == Actions.Increment) {
    state.count = state.count + 1;
  } else if (action == Actions.Decrement) {
    state.count = state.count - 1;
  }

  return state;
}

void reduxAppInit() {
  runApp(new CountApp());
}

class CountApp extends StatelessWidget {
  // store 初始化
  final Store store = new Store<CountState>(
    counterReducer,
    // state 初始化
    initialState: new CountState.initState(),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<CountState>(
      store: store,
      child: new MaterialApp(
        title: 'count',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Count(),
      ),
    );
  }
}

class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Flutter Count'),
      ),
      body: new Container(
        child: Center(
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              // store和text绑定
              new StoreConnector<CountState, String>(
                converter: (store) => store.state.count.toString(),
                builder: (context, count) {
                  return Text(
                    count,
                    style: Theme.of(context).textTheme.display1,
                  );
                },
              ),
              // store触发增加action
              new StoreConnector<CountState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(Actions.Increment);
                },
                builder: (context, callback) {
                  return new RaisedButton(
                    child: new Icon(Icons.add),
                    onPressed: callback,
                  );
                },
              ),
              // store触发增加action
              new StoreConnector<CountState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(Actions.Decrement);
                },
                builder: (context, callback) {
                  return new RaisedButton(
                    child: new Icon(Icons.remove),
                    onPressed: callback,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
