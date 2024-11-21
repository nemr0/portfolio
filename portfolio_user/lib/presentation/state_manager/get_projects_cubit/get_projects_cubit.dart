import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:portfolio_shared/domain/remote_source/firebase/get_projects.dart';

part 'get_projects_state.dart';
part 'get_projects_cubit.freezed.dart';

class GetProjectsCubit extends Cubit<GetProjectsState> {
  GetProjectsCubit() : super(const GetProjectsState.loading());
  getData({bool reload = false}) async {
    try{
    if(reload) emit(GetProjectsState.loading());
    final projects = await getProjectsFromFirebase();
    emit(GetProjectsState.success(projects));
    } on ExceptionImpl catch(e){
      emit(GetProjectsState.error(e));
    }
  }
}
