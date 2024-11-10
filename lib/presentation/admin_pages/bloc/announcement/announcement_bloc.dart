import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/announcement_service.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';
part 'announcement_bloc.freezed.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final AnnouncementService announcementService;

  AnnouncementBloc({required this.announcementService}) : super(const AnnouncementState.initial()) {
    on<_CreateAnnouncement>((event, emit) async {
      emit(const AnnouncementState.loading());

      try {
        await announcementService.createAnnouncement(
          event.title,
          event.description,
          event.date,
          event.time,
          event.files,
        );
        emit(const AnnouncementState.success());
      } catch (e) {
        emit(AnnouncementState.failure(e.toString()));
      }
    });

    on<_PickFiles>((event, emit) async {
      emit(AnnouncementState.filePicked(event.files));
    });

    on<_Reset>((event, emit) {
      emit(const AnnouncementState.initial());
    });
  }
}