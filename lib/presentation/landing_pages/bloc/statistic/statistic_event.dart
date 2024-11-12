part of 'statistic_bloc.dart';

@freezed
class StatisticEvent with _$StatisticEvent {
  const factory StatisticEvent.fetchStatistics() = FetchStatistics;
}