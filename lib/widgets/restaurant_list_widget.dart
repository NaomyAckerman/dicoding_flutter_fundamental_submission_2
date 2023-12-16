import 'package:flutter/material.dart';
import 'package:submission_proyek2/common/styles.dart';
import 'package:submission_proyek2/data/api/api_service.dart';
import 'package:submission_proyek2/data/model/restaurant.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  final Restaurant restaurant;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Hero(
            tag: "${restaurant.pictureId}_all",
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${ApiService.mediumImageUrl}${restaurant.pictureId}",
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          restaurant.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 3),
        RichText(
          text: TextSpan(
              style: const TextStyle(
                color: secondaryColor,
              ),
              children: [
                const TextSpan(
                  text: "Location ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: restaurant.city,
                )
              ]),
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text(
              restaurant.rating.toString(),
              style: const TextStyle(
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 7),
            Row(
              children: List.generate(
                restaurant.rating.round(),
                (index) => const Icon(
                  Icons.star,
                  size: 13,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
