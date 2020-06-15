import 'package:flutter/material.dart';
import 'package:myapp/examples/image-slide/card_data.dart';

class CardSlide extends StatefulWidget {
  CardSlide({@required this.data, this.parallaxPercent = 0.0});
  final CardData data;
  final double parallaxPercent;

  @override
  State<StatefulWidget> createState() => _CardState();
}

class _CardState extends State<CardSlide> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // image slide
        ClipRect(
          child: FractionalTranslation(
            translation: Offset(widget.parallaxPercent * 2.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                widget.data.asset,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // detail info
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                widget.data.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontFamily: "petita"
                ),
              ),
            ),
            Expanded(child: Container(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.data.time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 100.0,
                    letterSpacing: -5.0
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 8.0),
                  child: Text(
                    widget.data.tag,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(widget.data.icon, color: Colors.white,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    widget.data.place,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: Container(),),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  color: Colors.black.withOpacity(0.3)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.data.desc,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
