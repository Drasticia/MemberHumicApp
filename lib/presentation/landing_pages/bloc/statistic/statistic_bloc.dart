import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/home/static_service.dart';
import 'package:member_humic/data/models/respons/static_response_model.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';
part 'statistic_bloc.freezed.dart';

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final StatisticsService statisticsService;

  StatisticBloc(this.statisticsService) : super(const StatisticState.initial()) {
    on<FetchStatistics>(_onFetchStatistics);
  }

  Future<void> _onFetchStatistics(
    FetchStatistics event,
    Emitter<StatisticState> emit,
  ) async {
    emit(const StatisticState.loading());
    try {
      final statistics = await statisticsService.fetchStatistics();

      if (statistics != null) {
        // Filter out entries where year is 0 or null
        final filteredStatistics = StaticModel(
          totalDepartments: statistics.totalDepartments,
          totalFaculties: statistics.totalFaculties,
          totalBranches: statistics.totalBranches,
          totalActive: statistics.totalActive,
          usersGroupedByYear: statistics.usersGroupedByYear
              .where((entry) => entry.year != 0 && entry.year != null)
              .toList(),
          activeUsersGroupedByYear: statistics.activeUsersGroupedByYear
              .where((entry) => entry.year != 0 && entry.year != null)
              .toList(),
        );

        emit(StatisticState.loaded(filteredStatistics));
      } else {
        emit(const StatisticState.error("Failed to load statistics."));
      }
    } catch (e) {
      emit(StatisticState.error("Error: $e"));
    }
  }

}
