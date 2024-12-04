part of 'add_project_cubit.dart';

@freezed
class AddProjectState with _$AddProjectState {
  const factory AddProjectState.initial() = _Initial;
  const factory AddProjectState.uploadingFiles() = _UploadingFiles;
  const factory AddProjectState.filesUploaded() = _FilesUploaded;
  const factory AddProjectState.filesUploadError(ExceptionImpl exception) = _FilesUploadError;
  const factory AddProjectState.savingData() = _SavingData;
  const factory AddProjectState.success() = _Success;
  const factory AddProjectState.error(ExceptionImpl exception) = _Error;

}
