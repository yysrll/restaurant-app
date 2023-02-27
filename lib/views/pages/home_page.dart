part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
          child: Text(
            "Recommendation for you!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiService()),
          child: const RestaurantListItem(),
        ))
      ],
    );
  }
}
