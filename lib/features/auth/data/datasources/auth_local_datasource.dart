class AuthLocalDataSource {
  Future<bool> signInMock(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return username == 'demo' && password == 'demo';
  }
}
