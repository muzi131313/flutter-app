import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/examples/image-slide/card_flipper.dart';
import 'package:myapp/examples/image-slide/card_data.dart';

void imageSlideInit() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(CardFlipPage());
}

class CardFlipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardFlipPageState();
}

class _CardFlipPageState extends State<CardFlipPage> {
  double scrollPercent = 0.0;
  double scrollPercentParam;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 20.0,
            ),
            Expanded(
              child: CardFlipper(
                cards: cardDataList,
                scrollPercentParam: scrollPercentParam,
                onScroll: (double sp) {
                  print('sp: $sp');
                  setState(() {
                    this.scrollPercent = sp;
                  });
                }
              ),
            ),
            RaisedButton(
              child: Text("dynamic add pic"),
              onPressed: () {
                setState(() {
                  final double newScrollPercent = addOneData(this.scrollPercent);
                  print('newScrollPercent: $newScrollPercent');
                  this.scrollPercentParam = newScrollPercent;
                });
                print('dynamic add pic');
              },
            )
            // BottomBar(
            //   cardCount: cardDataList.length,
            //   scrollPercent: scrollPercent
            // )
          ],
        )
      ),
    );
  }
}
