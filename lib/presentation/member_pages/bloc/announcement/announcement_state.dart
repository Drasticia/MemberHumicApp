part of 'announcement_bloc.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState.initial() = Initial;
  const factory AnnouncementState.loading() = Loading;
  const factory AnnouncementState.loaded(List<Announcement> announcements) = Loaded;
  const factory AnnouncementState.error(String message) = Error;
}
