import 'package:flutter/material.dart';
import 'package:pilot_app/ViewModels/recipes_view_model.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/widget/button.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/widget/chip_filter_widget.dart';

class TopFilter extends StatelessWidget {
  final RecipesViewModel _recipesViewModel;
  const TopFilter(this._recipesViewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.filter_list),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          ChipFilterWidget(
            length: _recipesViewModel.listFilter.length,
            subject: _recipesViewModel.indexOfFilterSubject,
            listData: _recipesViewModel.listFilter,
            changeSelectedItem: _recipesViewModel.setCheckedFilter,
            isShowIcon: false,
          ),
          Button(onTap: () {}),
        ],
      ),
    );
  }
}
