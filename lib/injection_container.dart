// ignore_for_file: cascade_invocations, unnecessary_lambdas

import 'package:get_it/get_it.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/register_account.dart';
import 'features/auth/presentation/bloc/register_bloc/register_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  //blocs
  sl.registerLazySingleton<RegisterBloc>(
    () => RegisterBloc(),
  );

    //Use Cases
  sl.registerLazySingleton(
      () => RegisterAccountUseCase(repository: sl()),
    );

    //Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
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
