part of 'memberhistory_bloc.dart';

@freezed
class MemberhistoryState with _$MemberhistoryState {
  const factory MemberhistoryState.initial() = _Initial;
  const factory MemberhistoryState.loading() = _Loading;
  const factory MemberhistoryState.loaded(List<MemberHistory> members) = _Loaded;
  const factory MemberhistoryState.error(String message) = _Error;
}
