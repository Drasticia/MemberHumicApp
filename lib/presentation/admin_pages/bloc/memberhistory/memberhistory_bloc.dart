import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/memberhistory_service.dart';
import 'package:member_humic/data/models/respons/memberhistory_respons.dart';

part 'memberhistory_event.dart';
part 'memberhistory_state.dart';
part 'memberhistory_bloc.freezed.dart';

class MemberhistoryBloc extends Bloc<MemberhistoryEvent, MemberhistoryState> {
  final MemberHistoryService memberHistoryService;
  MemberhistoryBloc({required this.memberHistoryService}) : super(const MemberhistoryState.initial()) {
    on<_FetchHistory>(_onFetchHistory);
  }

  Future<void> _onFetchHistory(_FetchHistory event, Emitter<MemberhistoryState> emit) async {
    emit(const MemberhistoryState.loading());
    try {
      final members = await memberHistoryService.fetchMemberHistory(
        search: event.search,
        entries: event.entries,
      );
      print("Members fetched: ${members.length}"); // Debugging log
      emit(MemberhistoryState.loaded(members));
    } catch (error) {
      print("Error fetching members: $error"); // Debugging log
      emit(MemberhistoryState.error(error.toString()));
    }
  }
}