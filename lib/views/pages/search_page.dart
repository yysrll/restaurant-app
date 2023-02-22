part of 'pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String restaurantQuery = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) => RestaurantSearchProvider(
          apiService: ApiService(), query: restaurantQuery),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: greyColor,
            title: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Center(child: Consumer<RestaurantSearchProvider>(
                builder: (context, prov, _) {
                  return TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            searchController.text = "";
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      hintText: 'search...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (newValue) {
                      setState(() {
                        restaurantQuery = newValue;
                        prov.getRestaurant(restaurantQuery);
                      });
                    },
                  );
                },
              )),
            ),
            titleTextStyle: Theme.of(context).textTheme.headline5,
          ),
          backgroundColor: greyColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: restaurantQuery != "",
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 32, bottom: 16, left: 16, right: 16),
                  child: Text(
                    "Result of $restaurantQuery",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              const Expanded(child: RestaurantListSearchItem())
            ],
          )),
    );
  }
}
