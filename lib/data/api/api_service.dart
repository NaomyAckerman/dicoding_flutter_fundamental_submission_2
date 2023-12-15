import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:submission_proyek2/data/model/restaurant_detail_result.dart';
import 'package:submission_proyek2/data/model/restaurant_list_result.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _smallImageUrl =
      'https://restaurant-api.dicoding.dev/images/small/';
  static const String _mediumImageUrl =
      'https://restaurant-api.dicoding.dev/images/medium/';
  static const String _largeImageUrl =
      'https://restaurant-api.dicoding.dev/images/large/';

  static String get largeImageUrl => _largeImageUrl;
  static String get mediumImageUrl => _mediumImageUrl;
  static String get smallImageUrl => _smallImageUrl;

  Future<RestaurantListResult> restaurantList() async {
    final response = await http.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantListResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResult> restaurantDetail() async {
    final response = await http.get(Uri.parse("${_baseUrl}list"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }
}
