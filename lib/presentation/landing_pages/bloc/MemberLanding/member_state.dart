part of 'member_bloc.dart';

@freezed
class MemberLandingState with _$MemberLandingState {
  const factory MemberLandingState.initial() = MemberInitial;
  
  const factory MemberLandingState.loading() = MemberLoading;

  const factory MemberLandingState.aboutLoaded(AboutMemberResponse memberRespons) = AboutLoaded;
  const factory MemberLandingState.memberDetailLoaded(User member) = MemberDetailLoaded;

  const factory MemberLandingState.error(String message) = MemberError;
}
