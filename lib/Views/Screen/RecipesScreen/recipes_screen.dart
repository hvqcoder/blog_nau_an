import 'package:flutter/material.dart';
import 'package:pilot_app/Models/recipes.dart';
import 'package:pilot_app/ViewModels/recipes_view_model.dart';
import 'package:pilot_app/Views/Screen/DetailScreen/detail_screen.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/widget/bottom_filter.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/widget/top_filter.dart';
import 'package:pilot_app/Views/Widget/recipes_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecipesScreen extends StatefulWidget {
  final RecipesViewModel _recipesViewModel;

  const RecipesScreen(this._recipesViewModel, {Key? key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget._recipesViewModel.getRecipes();
    widget._recipesViewModel.indexOfFilterSubject.sink.add(0);
    widget._recipesViewModel.indexOfFilterByMealSubject.sink.add(0);
    widget._recipesViewModel.indexOfFilterByDietSubject.sink.add(0);
  }

  @override
  Widget build(BuildContext context) {
    //bool isSearch = false;

    return Scaffold(
      //App Bar
      appBar: AppBar(
          // backgroundColor: isSearch ? Color(0xFF651FFF) : Colors.white,
          // title: isSearch
          //     ? Text('Recipes')
          //     : Container(
          //         child: TextField(
          //           maxLines: 1,
          //           enableSuggestions: true,
          //           decoration: InputDecoration(
          //             border: InputBorder.none,
          //             hintText: 'Search',
          //             icon: IconButton(
          //               icon: Icon(
          //                 Icons.arrow_back,
          //                 color: Colors.black,
          //               ),
          //               onPressed: () {
          //                 setState(() {
          //                   isSearch = !isSearch;
          //                 });
          //               },
          //             ),
          //           ),
          //         ),
          //       ),
          // actions: isSearch
          //     ? [
          //         IconButton(
          //           onPressed: () {
          //             setState(() {
          //               isSearch = !isSearch;
          //             });
          //           },
          //           icon: const Icon(Icons.search),
          //         ),
          //         IconButton(
          //           onPressed: () => showModalBottomSheet(
          //             context: context,
          //             builder: (context) => TopFilter(widget._recipesViewModel),
          //           ),
          //           icon: const Icon(Icons.filter_list),
          //         ),
          //       ]
          //     : null,
          title: Text(AppLocalizations.of(context)?.recipes ?? ''),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => TopFilter(widget._recipesViewModel),
              ),
              icon: const Icon(Icons.filter_list),
            ),
          ]),
      //END App Bar

      //Floating Action Button
      floatingActionButton: GestureDetector(
        child: Image.asset('assets/images/floating_action_button.png'),
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => BottomFilter(widget._recipesViewModel),
        ),
        behavior: HitTestBehavior.translucent,
      ),
      //END Floating Action Button

      //Body
      body: Container(
        margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: StreamBuilder<List<Recipes>>(
          stream: widget._recipesViewModel.listRecipesSubject,
          builder: (BuildContext context, AsyncSnapshot<List<Recipes>> snap) {
            if (snap.hasData) {
              List<Recipes> listData = snap.data ?? [];
              if (listData.isEmpty) {
                return const Center(
                  child: Text('No Recipes'),
                );
              } else {
                return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: RecipesItem(listData[index]),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailScreen(listData[index].id ?? 0),
                            ),
                          );
                        },
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
      ),
      //END Body
    );
  }
}
