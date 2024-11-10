part of 'projectgallery_bloc.dart';

@freezed
class ProjectgalleryEvent with _$ProjectgalleryEvent {
  const factory ProjectgalleryEvent.fetchAll() = FetchAllProjectGallery;
  const factory ProjectgalleryEvent.fetchById(int id) = FetchProjectGalleryById;
  const factory ProjectgalleryEvent.updateStatus({
    required int id,
    required String status,
    required String comment,
  }) = UpdateProjectGalleryStatus;
}