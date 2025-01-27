import 'package:flutter/foundation.dart';

class Category {
  final String? id, title, image;
  final int? numOfProducts;

  Category({this.id, this.title, this.image, this.numOfProducts});

  factory Category.fromjson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }
}

Category category = Category(
  id: "1",
  title: "Armschair",
  image: "https://i.imgur.com/JqKDdxj.png",
  numOfProducts: 100,
);
