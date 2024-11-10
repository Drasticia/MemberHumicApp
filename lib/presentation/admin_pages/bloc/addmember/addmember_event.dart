part of 'addmember_bloc.dart';

@freezed
class AddmemberEvent with _$AddmemberEvent {
  const factory AddmemberEvent.addMember({
    required String name,
    required String username,
    required String email,
    required String branch,
    required String password,
    required String retypePassword,
  }) = AddMember;
}