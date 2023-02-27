part of 'pages.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late StreamSubscription subscription;
  late ConnectivityResult conResult;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
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
    super.dispose();
  }

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[HomePage(), FavoritePage()];

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
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchPage())),
                icon: const Icon(Icons.search))
          ],
        ),
        backgroundColor: greyColor,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
          selectedItemColor: primaryColor,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
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
