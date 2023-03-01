import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/favorite_restaurant_provider.dart';
import 'package:restaurant_app/utils/app_color.dart';
import 'package:restaurant_app/utils/text_theme.dart';
import 'package:restaurant_app/views/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => FavoriteRestaurantProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: blackColor,
              ),
          primarySwatch: Colors.blue,
          textTheme: myTextTheme,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
