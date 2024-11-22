part of 'upload_cover_cubit.dart';

@freezed
class UploadCoverState with _$UploadCoverState {
  const factory UploadCoverState.initial() = _Initial;
  const factory UploadCoverState.pickingImage() = _PickingImage;
  const factory UploadCoverState.imagePicked() = _ImagePicked;
  const factory UploadCoverState.imagePickError(ExceptionImpl exception) = _ImagePickError;
  const factory UploadCoverState.uploadingImage(double progress) = _UploadingImage;
  const factory UploadCoverState.uploaded() = _UploadedImage;
  const factory UploadCoverState.apiError(ExceptionImpl exception) = _Error;
}
