part of 'pages.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
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
            padding: const EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
            child: Text(
              "Recommendation for you!",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
                builder: (context, snapshot){
                  final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
                  return ListView.builder(
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        return _buildRestaurantItem(context, restaurants[index]);
                      }
                  );
                },
              ),
          )
        ],
      )
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: whiteColor,),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                restaurant.pictureId,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 80,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        MdiIcons.star,
                        color: primaryLightColor,
                        size: 16,
                      ),
                      const SizedBox(width: 8,),
                      Text(
                        restaurant.rating.toString(),
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}