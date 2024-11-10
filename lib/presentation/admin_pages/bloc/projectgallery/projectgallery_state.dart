part of 'projectgallery_bloc.dart';

@freezed
class ProjectgalleryState with _$ProjectgalleryState {
  const factory ProjectgalleryState.initial() = ProjectGalleryInitial;
  const factory ProjectgalleryState.loading() = ProjectGalleryLoading;
  const factory ProjectgalleryState.loaded(List<Data> galleries) = ProjectGalleryLoaded;
  const factory ProjectgalleryState.loadedSingle(Data gallery) = ProjectGalleryLoadedSingle;
  const factory ProjectgalleryState.updated() = ProjectGalleryUpdated;
  const factory ProjectgalleryState.error(String message) = ProjectGalleryError;
}
