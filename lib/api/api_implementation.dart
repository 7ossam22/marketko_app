import 'api_interface.dart';

class ApiImplementation extends ApiInterface {
  @override
  Future<List> getCategoriesList() async {
    // TODO: implement getCategoriesList
    throw UnimplementedError();
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
}
