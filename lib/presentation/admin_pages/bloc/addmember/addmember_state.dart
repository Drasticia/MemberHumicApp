part of 'addmember_bloc.dart';

@freezed
class AddmemberState with _$AddmemberState {
  const factory AddmemberState.initial() = AddMemberInitial;
  const factory AddmemberState.loading() = AddMemberLoading;
  const factory AddmemberState.success() = AddMemberSuccess;
  const factory AddmemberState.error(String message) = AddMemberError;
}
