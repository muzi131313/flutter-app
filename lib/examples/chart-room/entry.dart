import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

// doc: https://codelabs.developers.google.com/codelabs/flutter/index.html#8
// github:  git clone https://github.com/flutter/friendlychat-steps.git

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void appChartRoomInit() {
  runApp(
    new FriendlychatApp(),
    // new MaterialApp(
    //   title: "Friendlychat",
    //   home: new Scaffold(
    //     appBar: new AppBar(
    //       title: new Text("Friendlychat"),
    //     ),
    //   ),
    // ),
  );
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      theme: defaultTargetPlatform == TargetPlatform.iOS //new
          ? kIOSTheme //new
          : kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override //new
  State createState() => new ChatScreenState();

  // @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Friendlychat"),
        elevation:
            Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0, //new
      ),
    );
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController =
      new TextEditingController(); //new
  bool _isComposing = false;

  Widget _buildTextComposer() {
    return new IconTheme(
      //new
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          //new
          children: <Widget>[
            //new
            new Flexible(
              //new
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  //new
                  setState(() {
                    //new
                    _isComposing = text.length > 0; //new
                  }); //new
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              //new
              margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? new CupertinoButton(
                      //new
                      child: new Text("Send"), //new
                      onPressed: _isComposing //new
                          ? () => _handleSubmitted(_textController.text) //new
                          : null,
                    )
                  : new IconButton(
                      //new
                      icon: new Icon(Icons.send), //new
                      // onPressed: () => _handleSubmitted(_textController.text),
                      onPressed: _isComposing
                          ? () =>
                              _handleSubmitted(_textController.text) //modified
                          : null,
                    ), //new
            ),
          ], //new
        ),
        // child: new TextField(
        //   controller: _textController,
        //   onSubmitted: _handleSubmitted,
        //   decoration: new InputDecoration.collapsed(hintText: "Send a message"),
        // ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    _textController.clear();
    setState(() {
      //new
      _isComposing = false; //new
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        //new
        duration: new Duration(milliseconds: 700), //new
        vsync: this, //new
      ),
    ); //new
    setState(() {
      //new
      _messages.insert(0, message); //new
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    //new
    for (ChatMessage message in _messages) //new
      message.animationController.dispose(); //new
    super.dispose(); //new
  }

  @override //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new Container(
        child: new Column(
          children: <Widget>[
            //new
            new Flexible(
              //new
              child: new ListView.builder(
                //new
                padding: new EdgeInsets.all(8.0), //new
                reverse: true, //new
                itemBuilder: (_, int index) => _messages[index], //new
                itemCount: _messages.length, //new
              ), //new
            ), //new
            new Divider(height: 1.0), //new
            new Container(
              //new
              decoration:
                  new BoxDecoration(color: Theme.of(context).cardColor), //new
              child: _buildTextComposer(), //modified
            ), //new
          ], //new
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS //new
            ? new BoxDecoration(
                //new
                border: new Border(
                  //new
                  top: new BorderSide(color: Colors.grey[200]), //new
                ), //new
              ) //new
            : null,
      ),
    );
  }
}

const String _name = "Your Name";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        //new
        parent: animationController,
        curve: Curves.easeOut,
      ), //new
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Expanded(
              //new
              child: new Column(
                //modified
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_name, style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
            // new Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     new Text(_name, style: Theme.of(context).textTheme.subhead),
            //     new Container(
            //       margin: const EdgeInsets.only(top: 5.0),
            //       child: new Text(text),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
