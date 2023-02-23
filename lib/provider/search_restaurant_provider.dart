import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/provider/enum_result_state.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;
  final String query;

  RestaurantSearchProvider({required this.apiService, required this.query}) {
    getRestaurant("");
  }

  late List<Restaurant> _restaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  List<Restaurant> get result => _restaurantResult;

  ResultState get state => _state;

  Future<dynamic> getRestaurant(String query) async {
    try {
      if (query == "") {
        _state = ResultState.initial;
        notifyListeners();
        return;
      }
      _state = ResultState.loading;
      notifyListeners();

      final restaurants = await apiService.getSearchRestaurant(query);
      if (restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Restaurant Not Found';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurants;
      }
    } on SocketException {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No Connection, please check your internet connectivity';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error, $e';
    }
  }
}
