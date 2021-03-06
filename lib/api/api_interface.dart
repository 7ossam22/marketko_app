import 'package:marketko_app/models/productmodel.dart';

enum ApiState { failed, successful, error }

abstract class IApi {
  Future<ApiState> signInWithCredentials(String email, String password);

  Future<ApiState> signUpWithCredentials(
      String username, String email, String password);

  Future<List> getCategoriesList();

  Future<List> getCarouselList();

  Future<List> getProductsList(String query);

  Future<Product> getProductsInCart(String productId);

  Future<bool> submitPlaceOrder();
}
