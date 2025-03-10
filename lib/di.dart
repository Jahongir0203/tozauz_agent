import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/dio_client.dart';
import 'core/utils/pref_manager.dart';
import 'features/common/cubit/auth/auth_cubit.dart';
import 'features/common/data/repository/auth.dart' show AuthRepository;
import 'features/common/domain/repository/auth.dart' show IAuthRepository;
import 'features/common/domain/uscase/auth/check_user_auth.dart' show CheckUserToAuthUseCase;
import 'features/common/domain/uscase/auth/logout.dart' show LogoutUseCase;

final inject = GetIt.instance;

Future<void> initDi() async {
  // Register SharedPreferences
  final SharedPreferences pref = await SharedPreferences.getInstance();
  inject.registerSingleton<SharedPreferences>(pref);

  // Register other dependencies
  inject.registerSingleton<DioClient>(DioClient(pref));
  initPrefManager(pref);
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
}

// Register prefManager
void initPrefManager(SharedPreferences pref) {
  inject.registerLazySingleton<PrefManager>(() => PrefManager(pref));
}

// Register prefManager
void _dataSources() {

  // Login
  // inject.registerLazySingleton<LoginDataSources>(
  //         () => LoginDataSourcesImpl(inject(), inject()));
  // inject.registerLazySingleton<PrefManager>(() => PrefM);
}

void _repositories() {
  // AUTH
  inject.registerLazySingleton<IAuthRepository>(() => AuthRepository(
        inject(),
      ));
}

void _useCase() {
  // AUTH
  inject.registerLazySingleton(() => LogoutUseCase(inject()));
  inject.registerLazySingleton(() => CheckUserToAuthUseCase(inject()));
  // inject.registerLazySingleton(() => LoginUseCase(inject()));
}

void _cubit() {
  // AUTH
  // inject.registerFactory(() => MainTabCubit());
  inject.registerFactory(() => AuthCubit(inject(), inject(),));
}
