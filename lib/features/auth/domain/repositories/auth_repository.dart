abstract class AuthRepository {
  Future<bool> signIn(String username, String password);
}
