part of 'pages.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greyColor,
          title: const Text('Restaurant List'),
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
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurant> restaurants =
                      parseRestaurant(snapshot.data);
                  return ListView.builder(
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        return RestaurantTile(restaurant: restaurants[index]);
                      });
                },
              ),
            )
          ],
        ));
  }
}
