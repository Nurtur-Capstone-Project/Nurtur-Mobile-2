import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _local = AuthLocalDataSource();

  @override
  Future<bool> signIn(String username, String password) async {
    return _local.signInMock(username, password);
  }
}
