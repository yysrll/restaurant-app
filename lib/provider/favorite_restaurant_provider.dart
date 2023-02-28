import 'package:flutter/material.dart';
import 'package:restaurant_app/data/db/database_helper.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/provider/enum_result_state.dart';

class FavoriteRestaurantProvider extends ChangeNotifier {
  List<Restaurant> _restaurants = [];
  String _message = "";
  late ResultState _state;
  late DatabaseHelper _dbHelper;

  List<Restaurant> get result => _restaurants;
  String get message => _message;
  ResultState get state => _state;

  FavoriteRestaurantProvider() {
    _dbHelper = DatabaseHelper();
    _getAllFavoriteRestaurants();
  }

  void _getAllFavoriteRestaurants() async {
    _state = ResultState.loading;
    try {
      _restaurants = await _dbHelper.getFavoriteRestaurants();
      if (_restaurants.isNotEmpty) {
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
        _message = 'Restaurant Not Found';
      }
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error, $e';
    } finally {
      notifyListeners();
    }
  }

  Future<void> addFavoriteRestaurant(Restaurant restaurant) async {
    await _dbHelper.insertFavoriteRestaurant(restaurant);
    _getAllFavoriteRestaurants();
  }

  Future<Restaurant> getFavoriteRestaurantById(int id) async {
    return await _dbHelper.getFavoriteRestaurantById(id);
  }

  void deleteFavoriteRestaurant(int id) async {
    await _dbHelper.deleteFavoriteRestaurant(id);
    _getAllFavoriteRestaurants();
  }
}
