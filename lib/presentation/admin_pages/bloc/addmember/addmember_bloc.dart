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
