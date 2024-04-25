part of 'class_dashboard_bloc.dart';

sealed class ClassDashboardState extends Equatable {
  const ClassDashboardState();
  
  @override
  List<Object> get props => <Object> [];
}

final class ClassDashboardInitial extends ClassDashboardState {}

class GetDashboardError extends ClassDashboardState {
  const GetDashboardError({required this.errorMessage});
  final String errorMessage;
}
class GetDashboardInfoSuccessful extends ClassDashboardState {
  const GetDashboardInfoSuccessful({required this.tutorsList});
  final List<TutorModel> tutorsList;
}

class GetDashboardLoading extends ClassDashboardState {
  const GetDashboardLoading();
}
