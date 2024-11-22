import 'dart:typed_data';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:cross_file/cross_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/exceptions/parse_exception.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';

part 'upload_cover_state.dart';

part 'upload_cover_cubit.freezed.dart';

class UploadCoverCubit extends Cubit<UploadCoverState> {
  UploadCoverCubit() : super(const UploadCoverState.initial());
  static UploadCoverCubit get(BuildContext context) => BlocProvider.of<UploadCoverCubit>(context);
  XFile? cover;
  Uint8List? bytes;
  final cloudinary = Cloudinary.basic(
    cloudName: 'portfolio',
  );
  pickCover() async {
    emit(const UploadCoverState.pickingImage());
    try {
      FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
          // withReadStream: true,
          type: FileType.image,
          allowCompression: false,
          allowMultiple: false,
          // allowedExtensions: ['jpg', 'png', 'svg', 'gif']

      );
      if (filePickerResult == null) {
        emit(
          UploadCoverState.imagePickError(
            ParseException(message: 'Please Select A Photo!', stackTrace: null),
          ),
        );
        return;
      }
      cover = filePickerResult.xFiles.first;
      bytes = await cover?.readAsBytes();
      if (cover == null) {
        emit(
          UploadCoverState.imagePickError(
            ParseException(message: 'Please Select A Photo!', stackTrace: null),
          ),
        );
        return;
      }
      emit(const UploadCoverState.imagePicked());
    } catch (e, s) {

      emit(UploadCoverState.imagePickError(ParseException(
          message: 'Couldn\'t pick image, please try again!',
          error: e.toString(),
          stackTrace: s)));
    }
  }
  CloudinaryResponse? response;

  uploadCover() async {
    try {
      emit(const UploadCoverState.uploadingImage(0));
    response= await cloudinary.unsignedUploadResource(
        CloudinaryUploadResource(
          // filePath: cover!.path,
          uploadPreset: 'portfolio',
          fileBytes: (await cover!.readAsBytes()),
          progressCallback: (current, total) =>
              emit(UploadCoverState.uploadingImage(current / total)),
        ),
      );
      cover = null;
     emit(const UploadCoverState.uploaded());
    } catch (e, s) {
      print(e);
      print(s);
      emit(
        UploadCoverState.apiError(
          ServerException(
            endpoint: 'cloudinary',
            stackTrace: s,
            error: e.toString(),
            message: 'Something went wrong, please try again!'
          ),
        ),
      );
    }
  }
}
