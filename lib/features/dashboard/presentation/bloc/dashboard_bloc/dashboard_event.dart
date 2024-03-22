part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetUserInfo extends DashboardEvent {
  const GetUserInfo();
}
