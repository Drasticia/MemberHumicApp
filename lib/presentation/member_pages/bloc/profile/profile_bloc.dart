import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/profile_service.dart';
import 'package:member_humic/data/models/respons/userprofile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;

  ProfileBloc(this.profileService) : super(const ProfileState.initial()) {
    on<FetchProfile>(_onFetchProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  // Fetches user profile data
  Future<void> _onFetchProfile(FetchProfile event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());
    try {
      final profile = await profileService.getUserProfile();
      emit(ProfileState.loaded(profile)); // Emit loaded with UserProfile
    } catch (e) {
      emit(ProfileState.error("Failed to load profile: ${e.toString()}"));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    print('Update profile event triggered for user: ${event.updatedUser.name}');
    emit(const ProfileState.loading());
    try {
      await profileService.updateUserProfile(event.updatedUser, event.imageFile);
      emit(const ProfileState.updated());
    } catch (e) {
      emit(ProfileState.error("Failed to update profile: $e"));
    }
  }

}
