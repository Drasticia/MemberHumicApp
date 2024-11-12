part of 'project_g_bloc.dart';

@freezed
class ProjectGState with _$ProjectGState {
  const factory ProjectGState.initial() = _Initial;
  const factory ProjectGState.loading() = _Loading;
  const factory ProjectGState.loaded(ProjectGalleryHomeModel projects) = _Loaded;
  const factory ProjectGState.error(String message) = _Error;
}
