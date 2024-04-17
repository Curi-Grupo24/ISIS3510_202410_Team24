// ignore_for_file: cascade_invocations, unnecessary_lambdas

import 'package:get_it/get_it.dart';

import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/forgot_password_account.dart';
import 'features/auth/domain/usecases/login_account.dart';
import 'features/auth/domain/usecases/register_account.dart';
import 'features/auth/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'features/classes_list/data/repositories/classes_repository_impl.dart';
import 'features/classes_list/domain/repositories/classes_repository.dart';
import 'features/classes_list/domain/usecases/add_class_usecase.dart';
import 'features/classes_list/domain/usecases/delete_class_usecase.dart';
import 'features/classes_list/domain/usecases/fetch_all_classes_usecase.dart';
import 'features/classes_list/presentation/bloc/add_class_bloc/add_class_bloc.dart';
import 'features/classes_list/presentation/bloc/delete_class/delete_class_bloc.dart';
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'features/dashboard/domain/repositories/dashboard_repository.dart';
import 'features/dashboard/domain/usecases/get_my_classes.dart';
import 'features/dashboard/domain/usecases/get_my_tutor_classes.dart';
import 'features/dashboard/domain/usecases/get_user_info.dart';
import 'features/dashboard/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'features/dashboard/presentation/bloc/my_classes/my_classes_bloc.dart';
import 'features/dashboard/presentation/bloc/my_tutor_classes/my_tutor_classes_bloc.dart';
import 'features/profile_user/data/respositories/profile_repository_impl.dart';
import 'features/profile_user/domain/repositories/profile_repository.dart';
import 'features/profile_user/domain/usecases/get_user_info.dart';
import 'features/profile_user/presentation/bloc/profile_bloc/profile_bloc.dart';
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
  sl.registerLazySingleton<DashboardBloc>(
    () => DashboardBloc(),
  );
  sl.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(),
  );
  sl.registerLazySingleton<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(),
  );
  sl.registerLazySingleton<MyClassesBloc>(
    () => MyClassesBloc(),
  );
  sl.registerLazySingleton<AddClassBloc>(
    () => AddClassBloc(),
  );
  sl.registerLazySingleton<DeleteClassBloc>(
    () => DeleteClassBloc(),
  );
  sl.registerLazySingleton<MyTutorClassesBloc>(
    () => MyTutorClassesBloc(),
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
  sl.registerLazySingleton(
    () => GetProfileUserInfoUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => ForgotPasswordUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => FetchAllClassesUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => AddClassUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => GetMyClassesUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => DeleteClassUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => GetMyTutorClassesUseCase(repository: sl()),
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

  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(

        // datasource: sl(),
        ),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(

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
