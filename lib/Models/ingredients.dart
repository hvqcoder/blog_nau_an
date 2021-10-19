class Ingredients {
  String? name;
  String? images;
  String? amount;

  Ingredients.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    images = 'https://spoonacular.com/cdn/ingredients_250x250/' + json['image'];
    amount = ((json['amount'] as Map<String, dynamic>)['metric']
                as Map<String, dynamic>)['value']
            .toString() +
        ' ' +
        ((json['amount'] as Map<String, dynamic>)['metric']
                as Map<String, dynamic>)['unit']
            .toString();
  }
}
