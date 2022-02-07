// ignore_for_file: avoid_renaming_method_parameters, non_constant_identifier_names

import 'package:marketko_app/models/productmodel.dart';
import 'package:marketko_app/stubs/stub_data.dart';

import 'api_interface.dart';

class ApiImplementation extends ApiInterface {
  ApiImplementation Singleton() {
    ApiImplementation? _instance;
    _instance ??= ApiImplementation();
    return _instance;
  }

  final Stubs stubs = Stubs();

  @override
  Future<List> getCategoriesList() async {
    List _catList = stubs.CategoryList;
    return _catList;
  }

  @override
  Future<ApiState> signInWithCredentials(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
    if (email == 'admin' && password == 'admin') {
      return ApiState.successful;
    } else if (email != 'admin' || password != 'admin') {
      return ApiState.failed;
    } else {
      return ApiState.error;
    }
  }

  @override
  Future<ApiState> signUpWithCredentials(
      String username, String email, String password) async {
    // TODO: implement signUpWithCredentials
    throw UnimplementedError();
  }

  @override
  Future<List> getCarouselList() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    List carouselList = stubs.CarouselList;
    return carouselList;
  }

  @override
  Future<Product> getProductItemDetails(String productID) {
    // TODO: implement getProductItemDetails
    throw UnimplementedError();
  }

  @override
  Future<List> getProductsList() async {
    await Future.delayed(const Duration(milliseconds: 500));
    List productsList = stubs.ProductList;
    return productsList;
  }
}
