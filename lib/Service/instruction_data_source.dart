import 'package:http/http.dart';
import 'package:pilot_app/Models/instruction.dart';
import 'package:pilot_app/Service/constance.dart';
import 'package:pilot_app/Service/networking.dart';
import 'package:pilot_app/Service/request_type.dart';
import 'dart:convert';

class InstructionDataSource {
  final Networking _client = Networking(Client());
  //a69fc49a245f471694f06f268bf4eb88
  Future<Instruction> getInstruction({required int id}) async {
    final url = 'https://api.spoonacular.com/recipes/$id/analyzedInstructions'
        '?apiKey=${Constance.key}';
    try {
      final response = await _client
          .request(type: RequestType.GET, path: url, paramaters: {});
      Instruction instruction = Instruction();
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;
        if (jsonData.isNotEmpty) {
          final result = jsonData[0];
          if (result.containsKey('name')) {
            instruction.name = result['name'];
          }
          List<Steps> listStep = [];
          if (result.containsKey('steps')) {
            var list = result['steps'];
            for (var json in list) {
              Steps step = Steps.fromJson(json);
              listStep.add(step);
            }
          }
          instruction.steps = listStep;
        }
      }
      return instruction;

    } catch (e) {
      throw 'Lỗi get recipes';
    }
  }
}
