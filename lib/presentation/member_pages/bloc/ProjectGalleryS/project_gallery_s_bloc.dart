import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/projectgallery_service.dart';
import 'package:member_humic/data/datasources/projectgallerymember_service.dart';
import 'package:member_humic/data/models/request/projectgallerymember_moder.dart';

part 'project_gallery_s_event.dart';
part 'project_gallery_s_state.dart';
part 'project_gallery_s_bloc.freezed.dart';

class ProjectGallerySBloc extends Bloc<ProjectGallerySEvent, ProjectGallerySState> {
  final ProjectGalleryMemberService service;

  ProjectGallerySBloc({required this.service}) : super(const ProjectGallerySState.initial()) {
    on<FetchGallery>((event, emit) async {
      emit(const ProjectGallerySState.loading());
      try {
        final gallery = await service.fetchProjectGallery();
        emit(ProjectGallerySState.loaded(gallery));
      } catch (e) {
        emit(ProjectGallerySState.error(e.toString()));
      }
    });

    on<AddProjectGallery>((event, emit) async {
      emit(const ProjectGallerySState.loading());
      try {
        final project = await service.addProjectGalleryItem(
          title: event.title,
          description: event.description,
          date: event.date,
          thumbnail: event.thumbnail,
        );
        emit(ProjectGallerySState.added(project));
      } catch (e) {
        emit(ProjectGallerySState.error(e.toString()));
      }
    });
  }
}
