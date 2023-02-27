part of 'pages.dart';

class RestaurantListSearchItem extends StatefulWidget {
  const RestaurantListSearchItem({Key? key}) : super(key: key);

  @override
  State<RestaurantListSearchItem> createState() => _RestaurantListSearchItemState();
}

class _RestaurantListSearchItemState extends State<RestaurantListSearchItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantSearchProvider>(builder: (context, state, _) {
      if (state.state == ResultState.initial) {
        return const Center(child: Text('Find restaurant'));
      } else if (state.state == ResultState.loading) {
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
