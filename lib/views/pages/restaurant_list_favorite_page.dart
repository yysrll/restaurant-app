part of 'pages.dart';

class RestaurantListFavoriteItem extends StatefulWidget {
  const RestaurantListFavoriteItem({Key? key}) : super(key: key);

  @override
  State<RestaurantListFavoriteItem> createState() => _RestaurantListFavoriteItemState();
}

class _RestaurantListFavoriteItemState extends State<RestaurantListFavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteRestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              return RestaurantTile(restaurant: state.result[index]);
            });
      } else if (state.state == ResultState.noData) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: Text(state.message));
      }
    });
  }
}
