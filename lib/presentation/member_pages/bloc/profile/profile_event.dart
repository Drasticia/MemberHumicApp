part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.fetchProfile() = FetchProfile;
  const factory ProfileEvent.updateProfile(Data updatedUser, File? imageFile) = UpdateProfile;
}
