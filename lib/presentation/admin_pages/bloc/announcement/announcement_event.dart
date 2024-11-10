part of 'announcement_bloc.dart';

@freezed
class AnnouncementEvent with _$AnnouncementEvent {
  const factory AnnouncementEvent.createAnnouncement({
    required String title,
    required String description,
    required String date,
    required String time,
    required List<File> files,
  }) = _CreateAnnouncement;

  const factory AnnouncementEvent.pickFiles(List<File> files) = _PickFiles;
  const factory AnnouncementEvent.reset() = _Reset;
}