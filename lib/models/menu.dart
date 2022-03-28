import 'package:restaurant_app/models/drink.dart';
import 'package:restaurant_app/models/food.dart';

class Menu {
  late List<Food> foods;
  late List<Drink> drinks;

  Menu({
    required this.foods,
    required this.drinks
  });

  factory Menu.fromJson(Map<String, dynamic> menu) => Menu(
      foods: List<Food>.from(menu['foods'].map((e) => Food.fromJson(e))),
      drinks: List<Drink>.from(menu['foods'].map((e) => Drink.fromJson(e)))
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}