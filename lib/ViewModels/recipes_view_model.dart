import 'package:pilot_app/Models/recipes.dart';
import 'package:pilot_app/Service/recipes_data_source.dart';
import 'package:rxdart/rxdart.dart';

class RecipesViewModel {
  BehaviorSubject<List<Recipes>> listRecipesSubject = BehaviorSubject();

  BehaviorSubject<int> indexOfFilterSubject = BehaviorSubject();

  BehaviorSubject<int> indexOfFilterByMealSubject = BehaviorSubject();

  BehaviorSubject<int> indexOfFilterByDietSubject = BehaviorSubject();

  RecipesDataSource request = RecipesDataSource();

  RecipesViewModel() {
    getRecipes();
  }

  void getRecipes({String query = ''}) async {
    List<Recipes> list = await request.getRecipes(query: query);
    listRecipesSubject.sink.add(list);
  }

  final listFilter = [
    'All',
    'Newest',
    'Top Rated',
    'Most Popular',
    'Trendy',
    'Most Liked'
  ];

  final listFilterByMealType = [
    'Main course',
    'Snack',
    'Dessert',
    'Appetizer',
    'Drink',
    'Salad',
    'Finger food'
  ];

  final listFilterByDietType = [
    'Vegan',
    'Vegetarian',
    'Ketogenic',
    'Dairy Free',
    'Gluten Free',
    'Paleo',
    'Lacto-Vegetarian'
  ];

  void setCheckedFilter(int index) {
    indexOfFilterSubject.sink.add(index);
  }

  void setCheckedFilterByMeal(int index) {
    indexOfFilterByMealSubject.sink.add(index);
  }

  void setCheckedFilterByDiet(int index) {
    indexOfFilterByDietSubject.sink.add(index);
  }

  void dispose() {
    listRecipesSubject.close();
    indexOfFilterByMealSubject.close();
    indexOfFilterSubject.close();
    indexOfFilterByDietSubject.close();
  }
}
