import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  static const routeName = "/no_connection";

  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_connection.png",
              width: 250,
            ),
            const SizedBox(height: 10),
            Text(
              "No Connection",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
