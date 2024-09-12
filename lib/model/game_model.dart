import 'package:flutter/material.dart';

class GameModel {
  final String title;
  final String category;
  final String score;
  final String cover_image;
  final String image1;
  final String image2;
  final String image3;

  GameModel({
    required this.title,
    required this.category,
    required this.score,
    required this.cover_image,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  static List<GameModel> gameModelList = [
    GameModel(
      title: "Spiderman",
      category: "Action",
      score: "4.3",
      cover_image: "assets/images/spiderman/spiderman_cover.jpg",
      image1: "assets/images/spiderman/spiderman1.jpg",
      image2: "assets/images/spiderman/spiderman2.jpg",
      image3: "assets/images/spiderman/spiderman3.jpg",
    ),
    GameModel(
      title: "battleField",
      category: "Action",
      score: "4.8",
      cover_image: "assets/images/battlefield/battlefield_cover.jpg",
      image1: "assets/images/battlefield/battlefield1.jpg",
      image2: "assets/images/battlefield/battlefield2.jpg",
      image3: "assets/images/battlefield/battlefield3.jpg",
    ),
    GameModel(
        title: "crashbandicoot",
        category: "Action",
        score: "4.9",
        cover_image: "assets/images/crashbandicoot/crashbandicoot_cover.jpg",
        image1: "assets/images/crashbandicoot/crashbandicoot1.jpg",
        image2: "assets/images/crashbandicoot/crashbandicoot2.jpg",
        image3: "assets/images/crashbandicoot/crashbandicoot3.png"),
    GameModel(
        title: "call of duty",
        category: "Action",
        score: "4.6",
        cover_image: "assets/images/callofduty/callofduty_cover.jpg",
        image1: "assets/images/callofduty/callofduty1.jpg",
        image2: "assets/images/callofduty/callofduty2.jpg",
        image3: "assets/images/callofduty/callofduty2.jpg"),
    GameModel(
        title: "God of war",
        category: "Action",
        score: "5",
        cover_image: "assets/images/godOfwar/godofwar_cover.png",
        image1: "assets/images/godOfwar/god1.jpg",
        image2: "assets/images/godOfwar/god2.jpg",
        image3: "assets/images/godOfwar/god3.jpg"),
    GameModel(
        title: "Need for speed",
        category: "Racing",
        score: "4.6",
        cover_image: "assets/images/needforspeed/needforspeed_cover.png",
        image1: "assets/images/needforspeed/needforspeed1.jpg",
        image2: "assets/images/needforspeed/needforspeed2.jpg",
        image3: "assets/images/needforspeed/needforspeed3.png"),
  ];
}
