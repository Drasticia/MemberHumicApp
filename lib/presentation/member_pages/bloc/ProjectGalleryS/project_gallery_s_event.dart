part of 'project_gallery_s_bloc.dart';

@freezed
class ProjectGallerySEvent with _$ProjectGallerySEvent {
  const factory ProjectGallerySEvent.fetchGallery() = FetchGallery;
  const factory ProjectGallerySEvent.addProjectGallery({
    required String title,
    required String description,
    required String date,
    required File thumbnail,
  }) = AddProjectGallery;
}