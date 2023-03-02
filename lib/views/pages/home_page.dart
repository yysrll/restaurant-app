part of 'pages.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription subscription;
  late ConnectivityResult conResult;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    getConnectivity();
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(RestaurantDetailPage.routeName);
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
        conResult = result;
        isDeviceConnected = conResult == ConnectivityResult.wifi ||
            conResult == ConnectivityResult.mobile;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        }
      });

  @override
  void dispose() {
    subscription.cancel();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greyColor,
          title: const Text('GoResto'),
          titleTextStyle: Theme.of(context).textTheme.headlineSmall,
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, SearchPage.routeName),
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, FavoritePage.routeName),
                icon: const Icon(Icons.favorite_outline)),
            IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, SettingPage.routeName),
                icon: const Icon(Icons.settings_outlined)),
          ],
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
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ChangeNotifierProvider<RestaurantProvider>(
              create: (_) => RestaurantProvider(apiService: ApiService()),
              child: const RestaurantListItem(),
            ))
          ],
        ));
  }

  showDialogBox() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('No Connection'),
            content: const Text('Please check your internet connectivity'),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context, 'cancel');
                    setState(() {
                      isAlertSet = false;
                    });
                    conResult = await Connectivity().checkConnectivity();
                    isDeviceConnected = conResult == ConnectivityResult.wifi ||
                        conResult == ConnectivityResult.mobile;
                    if (!isDeviceConnected) {
                      showDialogBox();
                      setState(() {
                        isAlertSet = true;
                      });
                    }
                  },
                  child: const Text('OK'))
            ],
          ));
}
