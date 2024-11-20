part of 'get_projects_cubit.dart';

@freezed
@experimental
class GetProjectsState with _$GetProjectsState {
  const factory GetProjectsState.initial() = _Initial;
  const factory GetProjectsState.loading() = _Loading;
  const factory GetProjectsState.success(List<Project> data) = _Success;
  const factory GetProjectsState.error(ExceptionImpl exception) = _Error;
}
