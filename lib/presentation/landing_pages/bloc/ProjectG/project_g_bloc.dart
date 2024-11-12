import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/home/projectg_service.dart';
import 'package:member_humic/data/models/respons/projectgalleryhome_moder.dart';

part 'project_g_event.dart';
part 'project_g_state.dart';
part 'project_g_bloc.freezed.dart';

class ProjectGBloc extends Bloc<ProjectGEvent, ProjectGState> {
  final ProjectGService service;
   ProjectGBloc(this.service) : super(const ProjectGState.initial()) {
    on<FetchApprovedProjects>(_onFetchApprovedProjects);
  }

  Future<void> _onFetchApprovedProjects(
      FetchApprovedProjects event, Emitter<ProjectGState> emit) async {
    emit(const ProjectGState.loading());
    try {
      final projects = await service.fetchApprovedProjects();
      emit(ProjectGState.loaded(projects));
    } catch (e) {
      emit(ProjectGState.error(e.toString()));
    }
  }
}