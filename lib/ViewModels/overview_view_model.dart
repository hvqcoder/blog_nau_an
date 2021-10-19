import 'package:pilot_app/Models/overview.dart';
import 'package:pilot_app/Service/overview_data_source.dart';
import 'package:rxdart/rxdart.dart';

class OverviewViewModel {
  BehaviorSubject<Overview> detailOverviewSubject = BehaviorSubject();
  OverviewViewModel();

  OverviewDataSource req = OverviewDataSource();

  void getRecipesOverview(int id) async {
    Overview data = await req.getRecipesOverview(id: id);
    detailOverviewSubject.sink.add(data);
  }

  void dispose() {
    detailOverviewSubject.close();
  }
}
