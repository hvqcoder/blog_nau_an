import 'package:flutter/material.dart';
import 'package:pilot_app/ViewModels/overview_view_model.dart';

class OverviewTab extends StatelessWidget {
  final OverviewViewModel _overviewViewModel;
  final int id;

  const OverviewTab(this._overviewViewModel, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _overviewViewModel.getRecipesOverview(id);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: _overviewViewModel.detailOverviewSubject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                slide(size),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    _overviewViewModel.detailOverviewSubject.value.title
                        .toString(),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: type(
                            _overviewViewModel
                                    .detailOverviewSubject.value.isVegan ??
                                false,
                            'Vegan'),
                      ),
                      Expanded(
                        child: type(
                            _overviewViewModel
                                    .detailOverviewSubject.value.isDairyFree ??
                                false,
                            'Dairy Free'),
                      ),
                      Expanded(
                        child: type(
                            _overviewViewModel
                                    .detailOverviewSubject.value.isHealthy ??
                                false,
                            'Healthy'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: type(
                            _overviewViewModel
                                    .detailOverviewSubject.value.isVegetarian ??
                                false,
                            'Vegetarian'),
                      ),
                      Expanded(
                        child: type(
                            _overviewViewModel
                                    .detailOverviewSubject.value.isGlutenFree ??
                                false,
                            'Gluten Free'),
                      ),
                      Expanded(
                        child: type(
                            _overviewViewModel
                                    .detailOverviewSubject.value.isCheap ??
                                false,
                            'Cheap'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0x61000000),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Text(
                    _overviewViewModel
                            .detailOverviewSubject.value.description ??
                        '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0x99000000),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Có lỗi'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget slide(Size size) {
    return Stack(
      children: [
        SizedBox(
          height: size.width / 1.71,
          width: size.width,
          child: Image.network(
            _overviewViewModel.detailOverviewSubject.value.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Row(
            children: [
              item(
                  isIcon: true,
                  number: _overviewViewModel
                      .detailOverviewSubject.value.likesNumber
                      .toString()),
              const SizedBox(
                width: 16,
              ),
              item(
                  isIcon: false,
                  number: _overviewViewModel
                      .detailOverviewSubject.value.readyInMinutes
                      .toString()),
            ],
          ),
        )
      ],
    );
  }

  Widget item({required bool isIcon, required String number}) {
    return Column(
      children: [
        Icon(
          isIcon ? Icons.favorite : Icons.access_time,
          color: Colors.white,
        ),
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }

  Widget type(bool isStatus, String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          color: isStatus ? const Color(0xFF00c853) : const Color(0x61000000),
          size: 24,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(type,
            style: TextStyle(
              fontSize: 14,
              color:
                  isStatus ? const Color(0xFF00c853) : const Color(0x61000000),
            )),
      ],
    );
  }
}
