import 'package:flutter/material.dart';
import 'package:myapp/examples/image-slide/scroll_indicator.dart';

class BottomBar extends StatefulWidget {
  BottomBar({this.cardCount, this.scrollPercent});
final int cardCount;
final double scrollPercent;

  @override
  State<StatefulWidget> createState() => _BottomBarState();

}

class _BottomBarState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(child: Container(
            width: double.infinity,
            height: 5.0,
            child: ScrollIndicator(
              cardCount: widget.cardCount,
              scrollPercent: widget.scrollPercent
            ),
          )),
          Expanded(
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
