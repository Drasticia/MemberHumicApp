part of 'member_bloc.dart';

@freezed
class MemberLandingEvent with _$MemberLandingEvent {
  const factory MemberLandingEvent.fetchAbout() = FetchAbout;
  const factory MemberLandingEvent.fetchMemberDetail(int id) = FetchMemberDetail;
}