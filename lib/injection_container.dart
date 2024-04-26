// ignore_for_file: cascade_invocations, unnecessary_lambdas

import 'package:get_it/get_it.dart';

import 'core/analytics/services/analytics_service.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/forgot_password_account.dart';
import 'features/auth/domain/usecases/login_account.dart';
import 'features/auth/domain/usecases/register_account.dart';
import 'features/auth/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'features/class_flow/data/repositories/class_flow_repository_impl.dart';
import 'features/class_flow/domain/repositories/class_flow_repository.dart';
import 'features/class_flow/domain/usecases/get_dashboard_class_info.dart';
import 'features/class_flow/presentation/bloc/class_dashboard/class_dashboard_bloc.dart';
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
import 'features/enroll_as_monitor/data/repositories/enroll_tutor_repository_impl.dart';
import 'features/enroll_as_monitor/domain/repositories/enroll_tutor_repository.dart';
import 'features/enroll_as_monitor/domain/usecases/enroll_tutor_usecase.dart';
import 'features/enroll_as_monitor/presentation/bloc/enroll_bloc/enroll_tutor_bloc.dart';
import 'features/profile_user/data/respositories/profile_repository_impl.dart';
import 'features/profile_user/domain/repositories/profile_repository.dart';
import 'features/profile_user/domain/usecases/get_user_info.dart';
import 'features/profile_user/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'features/schedule/data/repositories/schedule_repository_impl.dart';
import 'features/schedule/domain/repositories/schedule_repository.dart';
import 'features/schedule/domain/usecases/register_event_usecase.dart';

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
  sl.registerLazySingleton<EnrollTutorBloc>(
    () => EnrollTutorBloc(),
  );
  sl.registerLazySingleton<ClassDashboardBloc>(
    () => ClassDashboardBloc(),
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
  sl.registerLazySingleton(
    () => EnrollTutorUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => RegisterEventUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => FetchDashbaordClassInfoUseCase(repository: sl()),
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
  sl.registerLazySingleton<EnrollTutorRepository>(
    () => EnrollTutorRepositoryImpl(
        // datasource: sl(),
        ),
  );
  sl.registerLazySingleton<ClassFlowRepository>(
    () => ClassFlowRepositoryImpl(
        // datasource: sl(),
        ),
  );

  //Services
  sl.registerLazySingleton(() => AnalyticsService());
  //DataSources

  // Core
  // sl.registerLazySingleton(
  //   () => HttpService(),
  // );
  //  sl.registerLazySingleton(() => Dio());
}
