import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/provider/enum_result_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _getRestaurant();
  }

  late List<Restaurant> _restaurantResult;
  late ResultState _state;
  String _message = '';
 
  String get message => _message;
 
  List<Restaurant> get result => _restaurantResult;
 
  ResultState get state => _state;

  Future<dynamic> _getRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurants = await apiService.getRestaurants();
      if (restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Restaurant Not Found';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurants;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error, $e';
    }
  }
  
}
