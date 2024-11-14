import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';

part 'addmember_event.dart';
part 'addmember_state.dart';
part 'addmember_bloc.freezed.dart';

class AddmemberBloc extends Bloc<AddmemberEvent, AddmemberState> {
  final UserRemoteDatasource userRemoteDatasource;
  
  AddmemberBloc(this.userRemoteDatasource) :  super(const AddMemberInitial()) {
    on<AddMember>(_onAddMember);
  }
  Future<void> _onAddMember(AddMember event, Emitter<AddmemberState> emit) async {
    if (event.name.isEmpty) {
      emit(const AddMemberError('Name is required'));
      return;
    }

    if (event.email.isEmpty) {
      emit(const AddMemberError('Email is required'));
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email)) {
      emit(const AddMemberError('Invalid email format'));
      return;
    }

    if (event.username.isEmpty) {
      emit(const AddMemberError('Username is required'));
      return;
    }

    if (event.password.isEmpty) {
      emit(const AddMemberError('Password is required'));
      return;
    }

    if (event.password.length < 6) {
      emit(const AddMemberError('Password must be at least 6 characters'));
      return;
    }

    if (event.retypePassword != event.password) {
      emit(const AddMemberError('Passwords do not match'));
      return;
    }
    emit(const AddMemberLoading());
    final result = await userRemoteDatasource.addMember(
      name: event.name,
      username: event.username,
      email: event.email,
      branch: event.branch,
      password: event.password,
      retypePassword: event.retypePassword,
    );
    result.fold(
      (error) => emit(AddMemberError(error)),
      (_) => emit(const AddMemberSuccess()),
    );
  }
}
