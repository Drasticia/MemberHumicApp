import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/projectgallery_service.dart';
import 'package:member_humic/data/models/respons/projectgallery_respons_model.dart';

part 'projectgallery_event.dart';
part 'projectgallery_state.dart';
part 'projectgallery_bloc.freezed.dart';

class ProjectgalleryBloc extends Bloc<ProjectgalleryEvent, ProjectgalleryState> {
  final ProjectGalleryService projectGalleryService;

  ProjectgalleryBloc(this.projectGalleryService) : super(const ProjectgalleryState.initial()) {
    on<FetchAllProjectGallery>(_onFetchProjectGalleryList);
    on<FetchProjectGalleryById>(_onFetchProjectGalleryDetail);
    on<UpdateProjectGalleryStatus>(_onUpdateProjectGalleryStatus);
  }

  Future<void> _onFetchProjectGalleryList(
      FetchAllProjectGallery event, Emitter<ProjectgalleryState> emit) async {
    emit(const ProjectgalleryState.loading());
    final result = await projectGalleryService.getProjectGalleryList();

    result.fold(
      (failure) => emit(ProjectgalleryState.error(failure)),
      (projects) => emit(ProjectgalleryState.loaded(projects)),
    );
  }

  Future<void> _onFetchProjectGalleryDetail(
      FetchProjectGalleryById event, Emitter<ProjectgalleryState> emit) async {
    emit(const ProjectgalleryState.loading());
    final result = await projectGalleryService.getProjectGalleryDetail(event.id);

    result.fold(
      (failure) => emit(ProjectgalleryState.error(failure)),
      (projectDetail) => emit(ProjectgalleryState.loadedSingle(projectDetail)),
    );
  }

  Future<void> _onUpdateProjectGalleryStatus(
      UpdateProjectGalleryStatus event, Emitter<ProjectgalleryState> emit) async {
    emit(const ProjectgalleryState.loading());
    final result = await projectGalleryService.updateProjectGalleryStatus(
      id: event.id,
      status: event.status,
      comment: event.comment,
    );

    result.fold(
      (failure) => emit(ProjectgalleryState.error(failure)),
      (successMessage) => emit(ProjectgalleryState.updated()),
    );
  }
}
