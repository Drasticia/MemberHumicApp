part of 'change_status_member_bloc.dart';

@freezed
class ChangeStatusMemberState with _$ChangeStatusMemberState {
  const factory ChangeStatusMemberState.initial() = _Initial;
  const factory ChangeStatusMemberState.loading() = _Loading;
  const factory ChangeStatusMemberState.success(ChangeStatusMember data) = _Success;
  const factory ChangeStatusMemberState.error(String message) = _Error;
}
