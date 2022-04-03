part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greyColor,
          title: const Text('GoResto'),
          titleTextStyle: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: greyColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, bottom: 16, left: 16, right: 16),
              child: Text(
                "Recommendation for you!",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ChangeNotifierProvider<RestaurantProvider>(
                create: (_) => RestaurantProvider(apiService: ApiService()),
                child: const RestaurantListItem(),
              )
            )
          ],
        ));
  }
}
