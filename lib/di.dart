import 'package:tozauz_agent/features/payment/data/datasource/payment_datasource.dart';
import 'package:tozauz_agent/features/payment/data/repository/payment_repository_impl.dart';
import 'package:tozauz_agent/features/payment/domain/repository/payment_repository.dart';
import 'package:tozauz_agent/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:tozauz_agent/features/profile/data/datasource/profile_datasource.dart';
import 'package:tozauz_agent/features/profile/data/repository/profile_repository_impl.dart';
import 'package:tozauz_agent/features/profile/domain/repository/profile_repository.dart';
import 'package:tozauz_agent/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:tozauz_agent/features/reports/data/datasource/reports_datasource.dart';
import 'package:tozauz_agent/features/reports/data/repository/reports_repository_impl.dart';
import 'package:tozauz_agent/features/reports/domain/repository/reports_repository.dart';
import 'package:tozauz_agent/features/reports/presentation/cubit/reports_cubit/reports_cubit.dart';
import 'export.dart';

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
  inject.registerLazySingleton<ContainerDataSource>(
    () => ContainerDataSourceImpl(
      inject(),
    ),
  );

  inject.registerLazySingleton<PaymentDatSource>(
      () => PaymentDataSourceImpl(dioClient: inject()));

  inject.registerLazySingleton<ReportsDataSource>(
      () => ReportsDataSourceImpl(inject()));

  inject.registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSourceImpl(inject()));
  // inject.registerLazySingleton<PrefManager>(() => PrefM);
}

void _repositories() {
  // AUTH
  inject.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      inject(),
      inject(),
    ),
  );

  inject.registerLazySingleton<ContainerRepository>(
    () => ContainerRepositoryImpl(
      inject(),
      // inject(),
    ),
  );
  inject.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(paymentDatSource: inject()),
  );

  inject.registerLazySingleton<ReportsRepository>(
      () => ReportsRepositoryImpl(inject()));

  inject.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(inject()));
}

void _useCase() {
  // AUTH
  inject.registerLazySingleton(() => LogoutUseCase(inject()));
  inject.registerLazySingleton(() => CheckUserToAuthUseCase(inject()));
  inject.registerLazySingleton(() => LoginUsecase(inject()));
}

void _cubit() {
  // AUTH
  // inject.registerFactory(() => MainTabCubit());
  inject.registerFactory(
    () => AuthCubit(
      inject(),
      inject(),
      inject(),
    ),
  );

  inject.registerFactory(() => ContainerCubit(inject()));
  inject.registerFactory(() => PaymentCubit(inject(), inject()));
  inject.registerFactory(() => ReportsCubit(inject()));
  inject.registerFactory(() => ProfileCubit(inject()));
}
