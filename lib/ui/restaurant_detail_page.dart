import 'package:flutter/material.dart';
import 'package:submission_proyek2/data/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = "/restaurant_detail";

  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Restaurant"),
      ),
      body: const Center(
        child: Text("Detail"),
      ),
    );
  }
}
