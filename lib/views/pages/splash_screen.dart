part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: primaryLightColor,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        const Icon(MdiIcons.foodTakeoutBox,
                            color: whiteColor, size: 64),
                        Text("GoResto",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold))
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 100, bottom: 32),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(120),
                          topRight: Radius.circular(120))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: "Find Your ",
                                  style: Theme.of(context).textTheme.titleLarge,
                                  children: const <TextSpan>[
                                TextSpan(
                                    text: 'Restaurant ',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(text: "Here")
                              ])),
                          const Text("Eat right. Work hard. Feel good.")
                        ],
                      ),
                      const CircularProgressIndicator()
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
