import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_detail.dart';
import 'package:restaurant_app/provider/enum_result_state.dart';


class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _getRestaurantDetail(id);
  }

  late RestaurantDetail _restaurantResult;
  late ResultState _state;
  String _message = '';
 
  String get message => _message;
 
  RestaurantDetail get result => _restaurantResult;
 
  ResultState get state => _state;

  Future<dynamic> _getRestaurantDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurant = await apiService.getRestaurantDetail(id);
      if (restaurant == null) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Restaurant Not Found';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error, $e';
    }
  }
  
}
