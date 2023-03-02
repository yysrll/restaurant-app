import 'dart:convert';
import 'dart:math';

import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/restaurant_detail.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<List<Restaurant>> getRestaurants() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return (result['restaurants'] as Iterable)
          .map((e) => Restaurant.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load resturant, try again!');
    }
  }

  Future<Restaurant> getRandomRestaurant() async {
    try {
      var restaurants = await getRestaurants();
      var randomIndex = Random().nextInt(restaurants.length);
      var randomRestaurant = restaurants.elementAt(randomIndex);
      return randomRestaurant;
    } catch (e) {
      throw Exception('Failed to load resturant, try again!');
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/' + id));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return RestaurantDetail.fromJson(result['restaurant']);
    } else {
      throw Exception('Failed to load resturant, try again!');
    }
  }

  Future<List<Restaurant>> getSearchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + query));

    // ignore: avoid_print
    print('status code: ${response.statusCode} of $query');
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return (result['restaurants'] as Iterable)
          .map((e) => Restaurant.fromJson(e))
          .toList();
    } else if (response.statusCode == 404) {
      return <Restaurant>[];
    } else {
      throw Exception('Failed to load resturant, try again!');
    }
  }
}
