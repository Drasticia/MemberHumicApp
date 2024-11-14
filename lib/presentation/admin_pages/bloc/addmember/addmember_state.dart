part of 'addmember_bloc.dart';

@freezed
class AddmemberState with _$AddmemberState {
  const factory AddmemberState.initial({
    @Default('') String nameError,
    @Default('') String emailError,
    @Default('') String usernameError,
    @Default('') String passwordError,
    @Default('') String retypePasswordError,
    @Default('') String branch,
    @Default('') String positionError,
    @Default('') String positionNameError,
  }) = AddMemberInitial;
  const factory AddmemberState.loading() = AddMemberLoading;
  const factory AddmemberState.success() = AddMemberSuccess;
  const factory AddmemberState.error(String message) = AddMemberError;
}
