part of 'pages.dart';

class RestaurantListItem extends StatefulWidget {
  const RestaurantListItem({Key? key}) : super(key: key);

  @override
  State<RestaurantListItem> createState() => _RestaurantListItemState();
}

class _RestaurantListItemState extends State<RestaurantListItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
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
