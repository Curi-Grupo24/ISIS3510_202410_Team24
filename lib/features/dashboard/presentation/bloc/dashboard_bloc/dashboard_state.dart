part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => <Object>[];
}

final class DashboardInitial extends DashboardState {}

class DashboardError extends DashboardState {
  const DashboardError({required this.errorMessage});
  final String errorMessage;
}

class DashboardSuccessfull extends DashboardState {
  const DashboardSuccessfull({
    required this.user,
  });
  final UserModel user;
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}
