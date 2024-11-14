import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/changestatusmember_service.dart';
import 'package:member_humic/data/models/respons/change_status_model.dart';

part 'change_status_member_event.dart';
part 'change_status_member_state.dart';
part 'change_status_member_bloc.freezed.dart';

class ChangeStatusMemberBloc extends Bloc<ChangeStatusMemberEvent, ChangeStatusMemberState> {
  final ChangeStatusMemberService service;
  ChangeStatusMemberBloc(this.service) : super(const ChangeStatusMemberState.initial()) {
    on<_ChangeStatus>((event, emit) async {
      emit(const ChangeStatusMemberState.loading());

      try {
        // Call the service to change the status
        final ChangeStatusMember result = await service.changeStatus(event.userId);

        // Emit success state with the result data
        emit(ChangeStatusMemberState.success(result));
      } catch (error) {
        // Emit error state with the error message
        emit(ChangeStatusMemberState.error('Failed to change status: $error'));
      }
    });
  }
}
