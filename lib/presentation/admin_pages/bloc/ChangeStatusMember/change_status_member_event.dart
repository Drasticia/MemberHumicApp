part of 'change_status_member_bloc.dart';

@freezed
class ChangeStatusMemberEvent with _$ChangeStatusMemberEvent {
  const factory ChangeStatusMemberEvent.changeStatus(int userId) = _ChangeStatus;
}