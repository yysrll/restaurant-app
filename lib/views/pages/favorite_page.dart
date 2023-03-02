part of 'pages.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite_page';
  
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greyColor,
        title: const Text('GoResto'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      backgroundColor: greyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
            child: Text(
              "Your favorite restaurant",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Expanded(child: RestaurantListFavoriteItem())
        ],
      ),
    );
  }
}
