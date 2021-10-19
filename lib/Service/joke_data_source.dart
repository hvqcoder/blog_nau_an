import 'package:http/http.dart';
import 'package:pilot_app/Models/joke.dart';
import 'package:pilot_app/Service/constance.dart';
import 'package:pilot_app/Service/networking.dart';
import 'package:pilot_app/Service/request_type.dart';
import 'dart:convert';

class JokeDataSource {
  final Networking _client = Networking(Client());
  //a69fc49a245f471694f06f268bf4eb88
  Future<Joke> getJoke() async {
    final url = 'https://api.spoonacular.com/food/jokes/random'
        '?apiKey=${Constance.key}';
    try {
      final response = await _client
          .request(type: RequestType.GET, path: url, paramaters: {});
      Joke joke = Joke();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.isNotEmpty) {
          joke = Joke.fromJson(jsonData);
        }
      }
      return joke;
    } catch (e) {
      throw 'Lỗi get recipes';
    }
  }
}