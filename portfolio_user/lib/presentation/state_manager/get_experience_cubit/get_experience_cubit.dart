import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/experience/experience.dart';
import 'package:portfolio_shared/domain/remote_source/database/pocket_base/pocket_base.dart';

part 'get_experience_state.dart';
part 'get_experience_cubit.freezed.dart';

class GetExperienceCubit extends Cubit<GetExperienceState> {
  GetExperienceCubit() : super(const GetExperienceState.initial());

  getData() async {
    try{
      emit(GetExperienceState.loading());
      final experience = await PocketBaseService().getExperienceItems();
      emit(GetExperienceState.success(experience));
    }on ExceptionImpl catch(e){
      emit(GetExperienceState.error(e) );
    }
  }
}
