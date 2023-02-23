part of 'pages.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  bool isFullDescription = false;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    super.initState();
  }

  void _setDescription(String description) {
    if (description.length > 200) {
      firstHalf = description.substring(0, 200);
      secondHalf = description.substring(200, description.length);
    } else {
      firstHalf = description;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            RestaurantDetailProvider(apiService: ApiService(), id: widget.id),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: greyColor,
          ),
          backgroundColor: greyColor,
          body: _getDetail(context),
        ));
  }

  Widget _getDetail(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.state == ResultState.hasData) {
        _setDescription(state.result.description);
        return ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: state.result.pictureId,
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/small/' +
                        state.result.pictureId,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.result.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        state.result.address,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.result.categories.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                    color: successTransparentColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    state.result.categories[index].name,
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(color: successColor),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width - 124,
                          decoration: const BoxDecoration(
                              color: successTransparentColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Icon(
                                    MdiIcons.mapMarker,
                                    color: primaryColor,
                                    size: 24,
                                  ),
                                  Text(
                                    state.result.city,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Icon(
                                    MdiIcons.star,
                                    color: primaryLightColor,
                                    size: 24,
                                  ),
                                  Text(
                                    state.result.rating.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Description :',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      RichText(
                        text: TextSpan(
                            text: firstHalf,
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: <TextSpan>[
                              TextSpan(
                                  text: isFullDescription ? secondHalf : ''),
                              TextSpan(
                                  text: isFullDescription
                                      ? '...Show Less'
                                      : '...Show More',
                                  style: const TextStyle(color: dangerColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      isFullDescription = !isFullDescription;
                                      setState(() {});
                                    })
                            ]),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Menus :',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Drinks :',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.result.menus.drinks.length,
                      itemBuilder: (context, index) {
                        return MenuItemTile(
                            item: state.result.menus.drinks[index],
                            textColor: primaryDarkColor,
                            backgroundColor: primaryDarkTransparentColor);
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Foods :',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.result.menus.foods.length,
                      itemBuilder: (context, index) {
                        return MenuItemTile(
                            item: state.result.menus.foods[index],
                            textColor: successColor,
                            backgroundColor: successTransparentColor);
                      }),
                ),
              ],
            ),
          ],
        );
      } else if (state.state == ResultState.noData) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: Text(state.message));
      }
    });
  }
}
