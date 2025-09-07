import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/repositories_impl/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';

final GetIt sl = GetIt.instance;

class DI {
  static Future<void> setup() async {
    // External
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(sharedPrefs);

    // Repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

    // Add more registrations here (datasources, usecases, blocs/providers)
  }
}
