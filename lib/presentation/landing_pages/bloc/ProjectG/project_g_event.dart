part of 'project_g_bloc.dart';

@freezed
class ProjectGEvent with _$ProjectGEvent {
  const factory ProjectGEvent.fetchApprovedProjects() = FetchApprovedProjects;
}