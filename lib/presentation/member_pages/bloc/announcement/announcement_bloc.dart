import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/announcementmember_service.dart';
import 'package:member_humic/data/models/request/announcement_model.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';
part 'announcement_bloc.freezed.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementServiceMember service;

  AnnouncementBloc(this.service) : super(const AnnouncementState.initial()) {
    on<FetchAnnouncements>((event, emit) async {
      emit(const AnnouncementState.loading());
      try {
        final announcements = await service.fetchAnnouncements();
        emit(AnnouncementState.loaded(announcements));
      } catch (e) {
        emit(AnnouncementState.error(e.toString()));
      }
    });
  }
}
