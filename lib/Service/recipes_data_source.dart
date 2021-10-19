import 'package:http/http.dart';
import 'package:pilot_app/Models/recipes.dart';
import 'package:pilot_app/Service/networking.dart';
import 'package:pilot_app/Service/request_type.dart';
import 'dart:convert';

import 'constance.dart';

class RecipesDataSource {
  final Networking _client = Networking(Client());
  //a69fc49a245f471694f06f268bf4eb88
  Future<List<Recipes>> getRecipes(
      {String query = ''}) async {
    final url = 'https://api.spoonacular.com/recipes/complexSearch'
        '?query=$query'
        '&addRecipeInformation=true'
        '&offset=0'
        '&number=10'
        '&apiKey=${Constance.key}';
    try {
      final response = await _client
          .request(type: RequestType.GET, path: url, paramaters: {});
      List<Recipes> recipesList = [];
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.containsKey('results')) {
          var result = jsonData['results'] as List<dynamic>;
          for (var item in result) {
            Recipes recipes = Recipes.fromJson(item);
            recipesList.add(recipes);
          }
        }
      }
      return recipesList;
    } catch (e) {
      throw 'Lỗi get recipes';
    }
  }
}
