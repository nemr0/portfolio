part of 'get_experience_cubit.dart';

@freezed
class GetExperienceState with _$GetExperienceState {
  const factory GetExperienceState.initial() = _Initial;
  const factory GetExperienceState.loading() = _Loading;
  const factory GetExperienceState.success(List<ExperienceItem> data) = _Success;
  const factory GetExperienceState.error(ExceptionImpl exception) = _Error;
}
