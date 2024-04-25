part of 'class_dashboard_bloc.dart';

sealed class ClassDashboardEvent extends Equatable {
  const ClassDashboardEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetDashboardClassInitial extends ClassDashboardEvent {
  const GetDashboardClassInitial({
    required this.availableTutors,
  });
  final List<String> availableTutors;
}
