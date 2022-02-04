import 'package:marketko_app/stubs/stub_data.dart';
import 'api_interface.dart';

class ApiImplementation extends ApiInterface {
  // ignore: non_constant_identifier_names
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
}
