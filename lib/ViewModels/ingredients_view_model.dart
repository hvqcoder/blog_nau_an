import 'package:pilot_app/Models/ingredients.dart';
import 'package:pilot_app/Service/ingredients_data_source.dart';
import 'package:rxdart/rxdart.dart';

class IngredientsViewModel {
  BehaviorSubject<List<Ingredients>> ingredientsSubject = BehaviorSubject();
  //BehaviorSubject<int> idSubject = BehaviorSubject();

  IngredientsViewModel() ;
  // {
  //   getIngredients(id: idSubject.stream.value);
  // }

  IngredientsDataSource req = IngredientsDataSource();

  void getIngredients({required int id}) async {
    List<Ingredients> list = await req.getIngredients(id: id);
    ingredientsSubject.sink.add(list);
  }

  void dispose() {
    ingredientsSubject.close();
  }
}
