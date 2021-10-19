import 'package:flutter/material.dart';
import 'package:pilot_app/ViewModels/home_view_model.dart';
import 'package:pilot_app/ViewModels/joke_view_model.dart';
import 'package:pilot_app/ViewModels/recipes_view_model.dart';
import 'package:pilot_app/Views/Screen/FavoritesScreen/favorites_screen.dart';
import 'package:pilot_app/Views/Screen/JokeScreen/joke_screen.dart';
import 'package:pilot_app/Views/Screen/RecipesScreen/recipes_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel _homeViewModel;

  const HomeScreen(this._homeViewModel, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabs = [
    RecipesScreen(RecipesViewModel()),
    const FavoriteScreen(),
    JokeScreen(JokeViewModel()),
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[widget._homeViewModel.indexSubject.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget._homeViewModel.indexSubject.value,
        onTap: (index) => setState(() {
          widget._homeViewModel.changeIndex(index);
        }),
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book),
            label: AppLocalizations.of(context)?.bottomNvgRecipes ?? '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: AppLocalizations.of(context)?.bottomNvgFavorites ?? '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.tag_faces_rounded),
            label: AppLocalizations.of(context)?.bottomNvgJole ?? '',
          )
        ],
      ),
    );
  }
}
