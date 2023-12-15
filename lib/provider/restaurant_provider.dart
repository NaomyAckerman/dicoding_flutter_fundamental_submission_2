import 'dart:async';

import 'package:flutter/material.dart';
import 'package:submission_proyek2/data/api/api_service.dart';
import 'package:submission_proyek2/data/model/restaurant_list_result.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  late RestaurantListResult _restaurantListResult;
  late ResultState _state;
  String _message = '';
  final int _count = 0;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  RestaurantListResult get result => _restaurantListResult;

  ResultState get state => _state;

  String get message => _message;

  int get count => _count;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final result = await apiService.restaurantList();
      if (result.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantListResult = result;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Internal Server Error';
    }
  }
}
