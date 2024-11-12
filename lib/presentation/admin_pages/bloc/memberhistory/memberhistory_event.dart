part of 'memberhistory_bloc.dart';

@freezed
class MemberhistoryEvent with _$MemberhistoryEvent {
  const factory MemberhistoryEvent.fetchHistory({String? search,  @Default(10) int entries}) = _FetchHistory;
}