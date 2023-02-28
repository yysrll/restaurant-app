part of 'pages.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
            child: ChangeNotifierProvider<FavoriteRestaurantProvider>(
          create: (_) => FavoriteRestaurantProvider(),
          child: const RestaurantListFavoriteItem(),
        ))
      ],
    );
  }
}
