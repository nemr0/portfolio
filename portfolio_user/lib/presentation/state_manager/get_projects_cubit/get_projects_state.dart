part of 'get_projects_cubit.dart';

@freezed
class GetProjectsState with _$GetProjectsState {
  const factory GetProjectsState.loading() = GetProjectsLoading;
  const factory GetProjectsState.success(List<Project> data) = GetProjectsSuccess;
  const factory GetProjectsState.error(ExceptionImpl exception) = GetProjectsError;
}
