part of 'member_bloc.dart';

@freezed
class MemberState with _$MemberState {
  const factory MemberState.initial() = _Initial;
  const factory MemberState.loading() = _Loading;
  const factory MemberState.success(List<Member> members) = _Success;
  const factory MemberState.error(String message) = _Error;
}
