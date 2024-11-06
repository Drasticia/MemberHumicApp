import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/user_remote_datasource.dart';
import 'package:member_humic/data/models/request/user_request_model.dart';

part 'member_event.dart';
part 'member_state.dart';
part 'member_bloc.freezed.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final UserRemoteDatasource userRemoteDatasource;
  List<Member> members = [];

  MemberBloc(this.userRemoteDatasource) : super(const MemberState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(const MemberState.loading());
      try {
        final result = await userRemoteDatasource.getMembers(
          page: event.page,
          entriesPerPage: event.entriesPerPage,
          searchQuery: event.searchQuery,
          selectedProdi: event.selectedProdi,
          selectedFaculty: event.selectedFaculty,
          selectedBranch: event.selectedBranch,
        );
        result.fold(
          (l) => emit(MemberState.error(l)),
          (r) {
            members = r.data;
            emit(MemberState.success(r.data));
          },
        );
      } catch (e) {
        emit(MemberState.error('Terjadi kesalahan saat memuat produk.'));
      }
    });
  }
}