import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_proyek2/common/styles.dart';
import 'package:submission_proyek2/data/api/api_service.dart';
import 'package:submission_proyek2/data/model/restaurant.dart';
import 'package:submission_proyek2/provider/restaurant_provider.dart';
import 'package:submission_proyek2/ui/no_connection_page.dart';
import 'package:submission_proyek2/ui/restaurant_detail_page.dart';
import 'package:submission_proyek2/ui/restaurant_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submission Proyek 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: cColorScheme(context),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: cTextTheme,
        appBarTheme: cAppBarTheme,
        elevatedButtonTheme: cElevatedButtonTheme,
        textButtonTheme: cTextButtonTheme,
        useMaterial3: true,
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        NoConnectionPage.routeName: (context) => const NoConnectionPage(),
        RestaurantListPage.routeName: (context) => ChangeNotifierProvider(
            create: (_) => RestaurantProvider(apiService: ApiService()),
            child: const RestaurantListPage()),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
