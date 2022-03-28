import 'package:restaurant_app/models/menu_item.dart';

class Menu {
  late List<MenuItem> foods;
  late List<MenuItem> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> menu) => Menu(
      foods:
          List<MenuItem>.from(menu['foods'].map((e) => MenuItem.fromJson(e))),
      drinks:
          List<MenuItem>.from(menu['drinks'].map((e) => MenuItem.fromJson(e))));

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
