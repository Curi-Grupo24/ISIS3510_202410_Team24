import 'package:get/route_manager.dart';

import '../../features/auth/presentation/pages/pages.dart';
import '../../features/chats/presentation/pages/pages.dart';
import '../../features/class_flow/presentation/pages/pages.dart';
import '../../features/classes_list/presentation/pages/pages.dart';
import '../../features/dashboard/presentation/pages/pages.dart';
import '../../features/enroll_as_monitor/presentation/pages/pages.dart';
import '../../features/notifications/presentation/pages/notifications_home.dart';
import '../../features/profile_user/presentation/pages/pages.dart';
import '../../features/schedule/presentation/pages/pages.dart';
import '../../features/tutors_class_flow/presentation/pages/pages.dart';

List<GetPage<dynamic>> get getRoutes {
  const Duration transitionDuration = Duration(milliseconds: 350);
  return <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: '/login',
      page: Login.new,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/register',
      page: RegisterView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/forgot_password',
      page: ForgotPasswordView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/dashboard_home',
      page: DashboardHome.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/enroll_monitor_home',
      page: OnbordingView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/enroll_questionnaire',
      page: CommonQuestionnaireView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/classes_list',
      page: SubjectScreen.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/profile_user',
      page: ProfileUser.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/notifications_home',
      page: NotificationHome.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/class_dashboard',
      page: ClassDashboard.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/schedule_home',
      page: ScheduleHome.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/schedule_register',
      page: ScheduleRegister.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/schedule_detail',
      page: ScheduleDetail.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/add_class_view',
      page: AddSubjectScreen.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/find_tutors',
      page: FindTutorsView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/chats_home',
      page: ChatHomeViewDashboard.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/waiting_confirmation',
      page: WaitingConfirmation.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    // GetPage<dynamic>(
    //   name: '/chat_view',
    //   page: ChatPage.new,
    //   transitionDuration: transitionDuration,
    //   middlewares: <GetMiddleware>[GetMiddleware()],
    // ),
  ];
}
