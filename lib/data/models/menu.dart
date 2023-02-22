import 'package:restaurant_app/data/models/item.dart';

class Menu {
  late List<Item> foods;
  late List<Item> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> menu) => Menu(
      foods:
          List<Item>.from(menu['foods'].map((e) => Item.fromJson(e))),
      drinks:
          List<Item>.from(menu['drinks'].map((e) => Item.fromJson(e))));

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
