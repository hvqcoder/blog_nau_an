class Instruction{
  String? name;
  List<Steps> steps =[];

  Instruction();

  Instruction.fromJson(Map<String, dynamic> json){
      name = json['name'];
      if(json.containsKey('steps')){
        for(var st in json['steps']){
          Steps step = Steps.fromJson(st);
          steps.add(step);
        }
      }
  }
}

class Steps{
  int? step;
  String? description;

  Steps.fromJson(Map<String, dynamic> json){
    step = json['number'];
    description = json['step'];
  }
}
