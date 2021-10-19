import 'package:pilot_app/Helper/delete_tag_html.dart';

class Recipes {
  int? id;
  bool? isVegan;
  String? title;
  int? readyInMinutes;
  String? imageUrl;
  String? description;
  int? likesNumber;

  Recipes();

  Recipes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isVegan = json['vegan'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    imageUrl = json['image'];
    description = DeleteTagHtml(json['summary']);
    likesNumber = json['aggregateLikes'];
  }
}
