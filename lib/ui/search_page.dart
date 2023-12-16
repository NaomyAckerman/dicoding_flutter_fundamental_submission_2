import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_proyek2/common/styles.dart';
import 'package:submission_proyek2/data/model/restaurant.dart';
import 'package:submission_proyek2/data/model/restaurant_detail_argument.dart';
import 'package:submission_proyek2/provider/restaurant_provider.dart';
import 'package:submission_proyek2/ui/restaurant_detail_page.dart';
import 'package:submission_proyek2/widgets/exception_widget.dart';
import 'package:submission_proyek2/widgets/input_widget.dart';
import 'package:submission_proyek2/widgets/restaurant_list_widget.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search";

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _keywordController = TextEditingController();

  void _onSearch() {
    Provider.of<RestaurantProvider>(context, listen: false)
        .fetchRestaurantByKeyword(_keywordController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _keywordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Page"),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: cPaddingHorizontalSize, vertical: 30),
          child: Column(
            children: [
              InputWidget(
                controller: _keywordController,
                hintText: 'Enter a search term',
                onEditingComplete: _onSearch,
                textInputAction: TextInputAction.search,
              ),
              const SizedBox(height: 30),
              Consumer<RestaurantProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.state == ResultState.hasData &&
                      state.searchResult?.restaurants != null) {
                    List<Restaurant> restaurants =
                        state.searchResult!.restaurants;
                    return Column(
                      children: [
                        if (_keywordController.text.isEmpty)
                          const ExceptionWidget(
                              title:
                                  'Please enter keywords to search for restaurants',
                              image: "assets/images/search_data.png")
                        else ...[
                          Text(
                            "${state.searchResult?.founded} restaurants found",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 15),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: cPaddingHorizontalSize),
                            itemBuilder: (context, index) {
                              Restaurant restaurant = restaurants[index];
                              return RestaurantListWidget(
                                restaurant: restaurant,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  RestaurantDetailPage.routeName,
                                  arguments: RestaruantDetailArgument(
                                      restaurant: restaurant,
                                      pictureTag:
                                          "${restaurant.pictureId}_all"),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: restaurants.length,
                          ),
                        ]
                      ],
                    );
                  } else if (state.state == ResultState.noData) {
                    return ExceptionWidget(
                      title: state.message,
                      image: "assets/images/no_data.png",
                      width: 200,
                    );
                  } else if (state.state == ResultState.error) {
                    return ExceptionWidget(
                      title: state.message,
                      image: "assets/images/no_connection.png",
                      width: 200,
                    );
                  } else {
                    return const ExceptionWidget(
                        title:
                            'Please enter keywords to search for restaurants',
                        image: "assets/images/search_data.png");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
