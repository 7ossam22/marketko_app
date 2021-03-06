import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injector/injector.dart';
import 'package:marketko_app/api/api_interface.dart';
import 'package:marketko_app/models/categorymodel.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final BuildContext context;

  HomeViewModel({required this.context});

  final IApi _api = Injector.appInstance.get<IApi>();
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

  onCategoryItemTap(Category category) {
    Navigator.pushNamed(context, 'products', arguments: category.name);
  }

  onMenuClicked() {
    //ToDo -> Implement menu handling here
    Fluttertoast.showToast(msg: 'Menu Clicked');
  }

  onCartClicked() {
    //ToDo -> Implement Navigation to Cart screen
    Navigator.pushNamed(context, 'cart');
  }

  onScreenDisposed() {
    _carouselList.add([]);
    _carouselList.add([]);
  }

  void onSearchingProducts(String query) {
    Navigator.pushNamed(context, 'products', arguments: query);
  }
}
