enum ApiState { failed, successful, error }

abstract class ApiInterface {
  Future<ApiState> signInWithCredentials(String email, String password);

  Future<ApiState> signUpWithCredentials(
      String username, String email, String password);

  Future<List> getCategoriesList();
  Future<List> getCarouselList();
}
