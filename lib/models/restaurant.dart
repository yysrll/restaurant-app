import 'dart:convert';

import 'package:restaurant_app/models/menu.dart';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menu menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menu
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
    id : restaurant['id'],
    name : restaurant['name'],
    description : restaurant['description'],
    pictureId : restaurant['pictureId'],
    city : restaurant['city'],
    rating : restaurant['rating'].toDouble(),
    menu: Menu.fromJson(restaurant['menus'])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
    "menus": menu.toJson(),
  };

}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((e) => Restaurant.fromJson(e)).toList();
}