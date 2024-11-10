part of 'member_bloc.dart';

@freezed
class MemberEvent with _$MemberEvent {
  const factory MemberEvent.fetch({
    required int page,
    required int entriesPerPage,
    String? searchQuery,
    String? selectedProdi,
    String? selectedFaculty,
    String? selectedBranch,
  }) = _Fetch;

  const factory MemberEvent.delete(int id) = _Delete;
}
