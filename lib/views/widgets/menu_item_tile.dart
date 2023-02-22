part of 'widgets.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile(
      {Key? key,
      required this.item,
      required this.textColor,
      required this.backgroundColor})
      : super(key: key);

  final Item item;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          item.name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
