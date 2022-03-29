part of 'pages.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  bool isFullDescription = false;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    if (widget.restaurant.description.length > 200) {
      firstHalf = widget.restaurant.description.substring(0, 200);
      secondHalf = widget.restaurant.description
          .substring(200, widget.restaurant.description.length);
    } else {
      firstHalf = widget.restaurant.description;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: greyColor,
          title: Text(widget.restaurant.name),
          titleTextStyle: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: greyColor,
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.restaurant.pictureId,
                  child: Image.network(
                    widget.restaurant.pictureId,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    widget.restaurant.city,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
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
                                    widget.restaurant.rating.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
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
                            .bodyText1
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      RichText(
                        text: TextSpan(
                            text: firstHalf,
                            style: Theme.of(context).textTheme.bodyText2,
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
                            .bodyText1
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
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.restaurant.menu.drinks.length,
                      itemBuilder: (context, index) {
                        return MenuItemTile(
                            item: widget.restaurant.menu.drinks[index],
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
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.restaurant.menu.foods.length,
                      itemBuilder: (context, index) {
                        return MenuItemTile(
                            item: widget.restaurant.menu.foods[index],
                            textColor: successColor,
                            backgroundColor: successTransparentColor);
                      }),
                ),
              ],
            ),
          ],
        ));
  }
}
