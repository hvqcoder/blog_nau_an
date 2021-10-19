import 'package:flutter/material.dart';
import 'package:pilot_app/Models/ingredients.dart';
import 'package:pilot_app/ViewModels/ingredients_view_model.dart';
import 'package:pilot_app/Views/Widget/ingredients_item.dart';

class IngredientsTab extends StatefulWidget {
  final IngredientsViewModel _ingredientsViewModel;
  final int id;

  const IngredientsTab(this._ingredientsViewModel, this.id, {Key? key}) : super(key: key);

  @override
  _IngredientsTabState createState() => _IngredientsTabState();
}

class _IngredientsTabState extends State<IngredientsTab> {
  @override
  void initState() {
    super.initState();
    widget._ingredientsViewModel.getIngredients(id: widget.id);
    //widget._ingredientsViewModel.idSubject.sink.add(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: StreamBuilder<List<Ingredients>>(
        stream: widget._ingredientsViewModel.ingredientsSubject,
        builder: (BuildContext context, AsyncSnapshot<List<Ingredients>> snap) {
          if (snap.hasData) {
            List<Ingredients> listData = snap.data ?? [];
            if (listData.isEmpty) {
              return const Center(
                child: Text('No Ingredient!'),
              );
            } else {
              return ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: IngredientsItem(listData[index]),
                      onTap: () {},
                    );
                  });
            }
          } else if (snap.hasError) {
            return const Center(child: Text('Có lỗi xảy ra'));
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
