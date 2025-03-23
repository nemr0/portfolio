import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/data/models/exceptions/exception_abs.dart';
import 'package:portfolio/data/models/experience/experience.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';

part 'get_experience_state.dart';
part 'get_experience_cubit.freezed.dart';

class GetExperienceCubit extends Cubit<GetExperienceState> {
  final BAASService baasService;
  GetExperienceCubit({required this.baasService}) : super(const GetExperienceState.initial());

  getData() async {
    try{
      emit(GetExperienceState.loading());
      final experience = await baasService.getExperienceItems();
      emit(GetExperienceState.success(experience));
    }on ExceptionImpl catch(e){
      emit(GetExperienceState.error(e) );
    }
  }
}
