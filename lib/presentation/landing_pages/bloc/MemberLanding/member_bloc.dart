import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/home/about_service.dart';
import 'package:member_humic/data/models/respons/About/aboutmember_response.dart';

part 'member_event.dart';
part 'member_state.dart';
part 'member_bloc.freezed.dart';

class MemberLandingBloc extends Bloc<MemberLandingEvent, MemberLandingState> {
  final MemberService memberService;

  MemberLandingBloc(this.memberService) : super(const MemberInitial()) {
    on<FetchAbout>(_onFetchAbout);
    on<FetchMemberDetail>(_onFetchMemberDetail);
  }

  // Handler for FetchAbout event
  Future<void> _onFetchAbout(FetchAbout event, Emitter<MemberLandingState> emit) async {
    emit(const MemberLoading());

    try {
      final AboutMemberResponse response = await memberService.fetchAbout();
      emit(AboutLoaded(response));
    } catch (e) {
      emit(MemberError(e.toString()));
    }
  }

  // Handler for FetchMemberDetail event
  Future<void> _onFetchMemberDetail(FetchMemberDetail event, Emitter<MemberLandingState> emit) async {
    emit(const MemberLoading());

    try {
      final User response = await memberService.fetchMemberDetail(event.id);
      emit(MemberDetailLoaded(response));
    } catch (e) {
      emit(MemberError(e.toString()));
    }
  }
}
