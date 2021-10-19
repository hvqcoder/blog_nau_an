import 'package:pilot_app/Helper/delete_tag_html.dart';

class Overview {
  int? id;
  String? imageUrl;
  int? likesNumber;
  int? readyInMinutes;

  String? title;

  bool? isVegan;
  bool? isDairyFree;
  bool? isHealthy;
  bool? isVegetarian;
  bool? isGlutenFree;
  bool? isCheap;

  String? description;

  Overview();

  Overview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image'];
    likesNumber = json['aggregateLikes'];
    readyInMinutes = json['readyInMinutes'];

    title = json['title'];

    isVegan = json['vegan'];
    isDairyFree = json['dairyFree'];
    isHealthy = json['veryHealthy'];
    isVegetarian = json['vegetarian'];
    isGlutenFree = json['glutenFree'];
    isCheap = json['cheap'];

    description = DeleteTagHtml(json['summary']);
  }
}
