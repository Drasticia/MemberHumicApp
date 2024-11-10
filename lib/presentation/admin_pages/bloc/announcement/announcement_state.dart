part of 'announcement_bloc.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState.initial() = _Initial;
  const factory AnnouncementState.loading() = _Loading;
  const factory AnnouncementState.success() = _Success;
  const factory AnnouncementState.failure(String message) = _Failure;
  const factory AnnouncementState.filePicked(List<File> files) = _FilePicked;
}
