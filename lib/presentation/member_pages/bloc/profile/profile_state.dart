part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded(UserProfile profile) = Loaded;
  const factory ProfileState.updated() = Updated;
  const factory ProfileState.error(String message) = Error;
}
