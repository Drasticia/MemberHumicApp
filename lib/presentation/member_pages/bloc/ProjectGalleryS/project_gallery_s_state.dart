part of 'project_gallery_s_bloc.dart';

@freezed
class ProjectGallerySState with _$ProjectGallerySState {
  const factory ProjectGallerySState.initial() = Initial;
  const factory ProjectGallerySState.loading() = Loading;
  const factory ProjectGallerySState.loaded(ProjectGalleryMemberModel gallery) = Loaded;
  const factory ProjectGallerySState.added(ProjectGallery project) = Added;
  const factory ProjectGallerySState.error(String message) = Error;
}
