import 'package:flutter/material.dart';

class CardData {
  String asset;
  String name;
  String time;
  String tag;
  IconData icon;
  String place;
  String desc;

  CardData(this.asset, this.name, this.time, this.tag, this.icon, this.place, this.desc);
}

List<CardData> cardDataList = [
  CardData("assets/image-slide/one.jpg", "江中树", "7 : 30", "AM", Icons.wb_sunny, "天府之地", "青山绿水"),
  CardData("assets/image-slide/two.jpg", "浮云", "12 : 20", "PM", Icons.cloud, "天堂", "浮兰藏青"),
  CardData("assets/image-slide/three.jpg", "路", "9 : 40", "AM", Icons.beach_access, "凡间", "平凡之路"),
  CardData("assets/image-slide/four.jpg", "船", "16 : 30", "PM", Icons.brightness_2, "幽冥", "白云苍狗"),
];

double addOneData(double startPercent) {
  final int oldCardDataLength = cardDataList.length;
  final double oldOnePercent = 1 / oldCardDataLength;
  final double index = startPercent / oldOnePercent;
  print('old current index: $index');
  CardData cardData = CardData("assets/image-slide/five.jpg", "书", "18 : 20", "PM", Icons.brightness_2, "鸳鸯", "风雨与共");
  cardDataList.add(cardData);
  final int cardDataLength = cardDataList.length;
  final double newOnePercent = 1 / cardDataLength;
  final double newStartPercent = newOnePercent * index;
  return newStartPercent;
}
