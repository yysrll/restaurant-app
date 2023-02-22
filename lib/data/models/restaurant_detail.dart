import 'package:restaurant_app/data/models/item.dart';
import 'package:restaurant_app/data/models/menu.dart';

class RestaurantDetail {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String address;
  late double rating;
  late List<Item> categories;
  late Menu menus;

  RestaurantDetail({
    required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.address,
      required this.rating,
      required this.categories,
      required this.menus,
      });

  factory RestaurantDetail.fromJson(Map<String, dynamic> detail) => RestaurantDetail(
        id: detail['id'],
        name: detail['name'],
        description: detail['description'],
        pictureId: detail['pictureId'],
        city: detail['city'],
        address: detail['address'],
        rating: detail['rating'].toDouble(),
        categories: List<Item>.from(detail['categories'].map((e) => Item.fromJson(e))),
        menus: Menu.fromJson(detail['menus']),
        
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "description": description,
  //       "pictureId": pictureId,
  //       "city": city,
  //       "address": address,
  //       "rating": rating,
  //       "categories": categories,
  //     };
}

