import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/models/restaurant.dart';

void main() {
  group('Parse getRestaurants Response Test', () {
    var jsonResponse = [
      {
        "id": "rqdv5juczeskfw1e867",
        "name": "Melting Pot",
        "description":
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
        "pictureId": "14",
        "city": "Medan",
        "rating": 4.2
      },
      {
        "id": "s1knt6za9kkfw1e867",
        "name": "Kafe Kita",
        "description":
            "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
        "pictureId": "25",
        "city": "Gorontalo",
        "rating": 4
      }
    ];
    test("Should be able to parse Restaurant Response from json to list", () {
      var list = jsonResponse.map((e) => Restaurant.fromJson(e)).toList();

      expect(list.length, 2);
      expect(list[1].id, "s1knt6za9kkfw1e867");
      expect(list[1].name, "Kafe Kita");
      expect(list[1].description,
          "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...");
      expect(list[1].pictureId, "25");
      expect(list[1].city, "Gorontalo");
      expect(list[1].rating, 4);
    });

    test("Should be able to parse Restaurant from list to json", () {
      var jsonRes = jsonResponse.map((e) => Restaurant.fromJson(e).toJson());

      expect(jsonRes.length, 2);
      expect(jsonRes.first["id"], "rqdv5juczeskfw1e867");
      expect(jsonRes.first["name"], "Melting Pot");
      expect(jsonRes.first["description"],
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...");
      expect(jsonRes.first["pictureId"], "14");
      expect(jsonRes.first["city"], "Medan");
      expect(jsonRes.first["rating"], 4.2);
    });
  });
}
