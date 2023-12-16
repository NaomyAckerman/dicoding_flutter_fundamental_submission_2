import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_proyek2/common/styles.dart';
import 'package:submission_proyek2/data/api/api_service.dart';
import 'package:submission_proyek2/data/model/restaurant_detail_argument.dart';
import 'package:submission_proyek2/provider/restaurant_provider.dart';
import 'package:submission_proyek2/ui/home_page.dart';
import 'package:submission_proyek2/ui/restaurant_detail_page.dart';
import 'package:submission_proyek2/ui/restaurant_list_page.dart';
import 'package:submission_proyek2/ui/review_page.dart';
import 'package:submission_proyek2/ui/search_page.dart';
import 'package:submission_proyek2/ui/splash_page.dart';

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
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        HomePage.routeName: (context) => const HomePage(),
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => ChangeNotifierProvider(
              create: (context) => RestaurantProvider(apiService: ApiService()),
              child: RestaurantDetailPage(
                arguments: ModalRoute.of(context)?.settings.arguments
                    as RestaruantDetailArgument,
              ),
            ),
        SearchPage.routeName: (context) => ChangeNotifierProvider(
            create: (context) => RestaurantProvider(apiService: ApiService()),
            child: const SearchPage()),
        ReviewPage.routeName: (context) => ChangeNotifierProvider(
              create: (context) => RestaurantProvider(apiService: ApiService()),
              child: ReviewPage(
                arguments: ModalRoute.of(context)?.settings.arguments
                    as RestaruantDetailArgument,
              ),
            ),
      },
    );
  }
}
