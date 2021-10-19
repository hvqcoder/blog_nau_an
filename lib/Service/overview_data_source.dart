import 'package:http/http.dart';
import 'package:pilot_app/Models/overview.dart';
import 'package:pilot_app/Service/constance.dart';
import 'package:pilot_app/Service/networking.dart';
import 'package:pilot_app/Service/request_type.dart';
import 'dart:convert';

class OverviewDataSource {
  final Networking _client = Networking(Client());
  //a69fc49a245f471694f06f268bf4eb88
  Future<Overview> getRecipesOverview({required int id}) async {
    final url = 'https://api.spoonacular.com/recipes/$id/'
        'information?includeNutrition=false'
        '&apiKey=${Constance.key}';
    try {
      final response = await _client
          .request(type: RequestType.GET, path: url, paramaters: {});
      Overview overview = Overview();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.isNotEmpty) {
          overview = Overview.fromJson(jsonData);
        }
      }
      return overview;
    } catch (e) {
      throw 'Lỗi get recipes';
    }
  }
}
