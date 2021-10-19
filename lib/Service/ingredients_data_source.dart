import 'package:http/http.dart';
import 'package:pilot_app/Models/ingredients.dart';
import 'package:pilot_app/Service/constance.dart';
import 'package:pilot_app/Service/networking.dart';
import 'package:pilot_app/Service/request_type.dart';
import 'dart:convert';

class IngredientsDataSource {
  final Networking _client = Networking(Client());
  //a69fc49a245f471694f06f268bf4eb88
  Future<List<Ingredients>> getIngredients({required int id}) async {
    final url = 'https://api.spoonacular.com/recipes/$id/ingredientWidget.json'
        '?apiKey=${Constance.key}';
    try {
      final response = await _client
          .request(type: RequestType.GET, path: url, paramaters: {});
      List<Ingredients> ingredientsList = [];
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.containsKey('ingredients')) {
          var result = jsonData['ingredients'] as List<dynamic>;
          for (var item in result) {
            Ingredients ingredients = Ingredients.fromJson(item);
            ingredientsList.add(ingredients);
          }
        }
      }
      return ingredientsList;
    } catch (e) {
      throw 'Lỗi get recipes';
    }
  }
}
