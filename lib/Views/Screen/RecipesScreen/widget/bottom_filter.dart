import 'package:flutter/material.dart';
import 'package:pilot_app/ViewModels/recipes_view_model.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/widget/button.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/widget/chip_filter_widget.dart';

class BottomFilter extends StatelessWidget {
  final RecipesViewModel _recipesViewModel;
  const BottomFilter(this._recipesViewModel, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Meal type',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ChipFilterWidget(
            length: _recipesViewModel.listFilterByMealType.length,
            subject: _recipesViewModel.indexOfFilterByMealSubject,
            listData: _recipesViewModel.listFilterByMealType,
            changeSelectedItem: _recipesViewModel.setCheckedFilterByMeal,
            isShowIcon: true,
          ),
          const SizedBox(height: 20),
          const Text(
            'Diet Type',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ChipFilterWidget(
            length: _recipesViewModel.listFilterByDietType.length,
            subject: _recipesViewModel.indexOfFilterByDietSubject,
            listData: _recipesViewModel.listFilterByDietType,
            changeSelectedItem: _recipesViewModel.setCheckedFilterByDiet,
            isShowIcon: true,
          ),
          Button(onTap: () {}),
        ],
      ),
    );
  }
}
