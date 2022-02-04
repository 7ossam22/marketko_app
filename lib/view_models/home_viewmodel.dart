import 'package:marketko_app/api/api_implementation.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final ApiImplementation _api = ApiImplementation().Singleton();
  final BehaviorSubject<List> _catList = BehaviorSubject.seeded([]);
  final BehaviorSubject<List> _carouselList = BehaviorSubject.seeded([]);

  Stream<List> get catList => _catList;
  Stream<List> get carouselList => _carouselList;

  onGettingCategoryList() async {
    _catList.add([]);
    _catList.add(await _api.getCategoriesList());
  }

  onGettingCarouselList() async {
   _carouselList.add(await _api.getCarouselList());
  }
}
