part of 'statistic_bloc.dart';

@freezed
class StatisticState with _$StatisticState {
  const factory StatisticState.initial() = _Initial;
  const factory StatisticState.loading() = _Loading;
  const factory StatisticState.loaded(StaticModel statistics) = _Loaded;
  const factory StatisticState.error(String message) = _Error;
}
