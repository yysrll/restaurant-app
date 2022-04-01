class MenuItem {
  late String name;

  MenuItem({required this.name});

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
