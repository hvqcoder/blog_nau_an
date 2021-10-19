import 'package:flutter/material.dart';
import 'package:pilot_app/ViewModels/ingredients_view_model.dart';
import 'package:pilot_app/ViewModels/instruction_view_model.dart';
import 'package:pilot_app/ViewModels/overview_view_model.dart';
import 'package:pilot_app/Views/Screen/DetailScreen/ingredients_tab.dart';
import 'package:pilot_app/Views/Screen/DetailScreen/instruction_tab.dart';
import 'package:pilot_app/Views/Screen/DetailScreen/overview_tab.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen(this.id, {Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "Overview",
              ),
              Tab(
                text: "Ingredients",
              ),
              Tab(
                text: "Instructions",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewTab(OverviewViewModel(), widget.id),
            IngredientsTab(IngredientsViewModel(), widget.id),
            InstructionTab(InstructionViewModel(), widget.id),
          ],
        ),
      ),
    );
  }
}
