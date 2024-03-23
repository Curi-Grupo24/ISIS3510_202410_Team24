// ignore_for_file: cascade_invocations, unnecessary_lambdas

import 'package:get_it/get_it.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_account.dart';
import 'features/auth/domain/usecases/register_account.dart';
import 'features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'features/classes_list/data/repositories/classes_repository_impl.dart';
import 'features/classes_list/domain/repositories/classes_repository.dart';
import 'features/schedule/data/repositories/schedule_repository_impl.dart';
import 'features/schedule/domain/repositories/schedule_repository.dart';
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'features/dashboard/domain/repositories/dashboard_repository.dart';
import 'features/dashboard/domain/usecases/get_user_info.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  //blocs
  sl.registerLazySingleton<RegisterBloc>(
    () => RegisterBloc(),
  );
  sl.registerLazySingleton<LoginBloc>(
    () => LoginBloc(),
  );
  sl.registerLazySingleton<DashboardBloc>(
    () => DashboardBloc(),
  );

  //Use Cases
  sl.registerLazySingleton(
    () => RegisterAccountUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => LoginAccountUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => GetUserInfoUseCase(repository: sl()),
  );

  //Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        // datasource: sl(),
        ),
  );
  
  sl.registerLazySingleton<ClassRepository>(
    () => ClasessRepositoryImpl(
        // datasource: sl(),
        ),
  );
  sl.registerLazySingleton<ScheduleRepository>(
    () => ScheduleRepositoryImpl(

  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(

        // datasource: sl(),
        ),
  );
  //DataSources

  // Core
  // sl.registerLazySingleton(
  //   () => HttpService(),
  // );
  //  sl.registerLazySingleton(() => Dio());
}
