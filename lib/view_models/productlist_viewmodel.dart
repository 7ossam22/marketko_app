import 'package:marketko_app/api/api_implementation.dart';
import 'package:rxdart/rxdart.dart';

class ProductScreenViewModel {

  final ApiImplementation _api = ApiImplementation().Singleton();

  final BehaviorSubject<List> _productsList = BehaviorSubject.seeded([]);

  Stream<List> get productList => _productsList;

  onGettingProductList() async {
    _productsList.add(await _api.getProductsList());
  }
}
