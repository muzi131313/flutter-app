import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:myapp/examples/image-slide/card_data.dart';
import 'package:myapp/examples/image-slide/card_slide.dart';

class CardFlipper extends StatefulWidget {
  CardFlipper({
    this.cards,
    this.onScroll,
    this.scrollPercentParam,
  });
  final List<CardData> cards;
  final Function(double scrollPercent) onScroll;
  final double scrollPercentParam;
  @override
  State<StatefulWidget> createState() => _CardFlipper();
}

enum Direction {
  LEFT, RIGHT
}

class _CardFlipper extends State<CardFlipper> with TickerProviderStateMixin{
  double scrollPercent = 0.0;
  Offset startDrag;
  double startDragPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;
  AnimationController finishScrollController;
  Direction direction = Direction.LEFT;

  double oldPercentParam;

  @override
  void initState() {
    super.initState();
    finishScrollController = AnimationController(duration: Duration(milliseconds: 150), vsync: this)
      ..addListener((){
          setState((){
            scrollPercent = ui.lerpDouble(finishScrollStart, finishScrollEnd, finishScrollController.value);
            widget.onScroll(scrollPercent);
          });
        });
  }

  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final allCardDragDistance = dragDistance / context.size.width;
    final numCards = widget.cards.length;
    if (allCardDragDistance > 0) {
      direction = Direction.LEFT;
    } else {
      direction = Direction.RIGHT;
    }
    setState(() {
      scrollPercent = (startDragPercentScroll + (- allCardDragDistance / numCards)).clamp(0.0, 1.0 - (1 / numCards));
      widget.onScroll(scrollPercent);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = widget.cards.length;
    finishScrollStart = scrollPercent;
    if (direction == Direction.LEFT) {
      finishScrollEnd = (scrollPercent * numCards).floor() / numCards;
    } else {
      finishScrollEnd = (scrollPercent * numCards).ceil() / numCards;
    }

    finishScrollController.forward(from: 0.0);
    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
    });
  }

  List<Widget> _buildCards() {
    int i = -1;
    final double scrollPercentParam = widget.scrollPercentParam;
    print('======scrollPercentParam: $scrollPercentParam, widget.cards.length: ${widget.cards.length}');
    if (scrollPercentParam != null && oldPercentParam != scrollPercentParam) {
      oldPercentParam = scrollPercentParam;
      return widget.cards.map<Widget>((cardData) {
        i++;
        return _buildCard(cardData, i, widget.cards.length, oldPercentParam);
      }).toList();
    }
    else {
      return widget.cards.map<Widget>((cardData) {
        i++;
        return _buildCard(cardData, i, widget.cards.length, scrollPercent);
      }).toList();
    }
  }

  Widget _buildCard(CardData cardData, int cardIndex, int cardCount, double scrollPercent) {
    final cardScrollPercent = scrollPercent * cardCount;
    final parallax = scrollPercent - (cardIndex / cardCount);

    return FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercent, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CardSlide(
            data: cardData,
            parallaxPercent: parallax
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: _buildCards(),
      ),
    );
  }

}
