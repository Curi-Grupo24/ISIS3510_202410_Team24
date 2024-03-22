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

final GetIt sl = GetIt.instance;

void init() {
  //blocs
  sl.registerLazySingleton<RegisterBloc>(
    () => RegisterBloc(),
  );
  sl.registerLazySingleton<LoginBloc>(
    () => LoginBloc(),
  );

  //Use Cases
  sl.registerLazySingleton(
    () => RegisterAccountUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => LoginAccountUseCase(repository: sl()),
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
