import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:portfolio_shared/domain/remote_source/database/firebase/get_projects.dart';

part 'get_projects_state.dart';
part 'get_projects_cubit.freezed.dart';

class GetProjectsCubit extends Cubit<GetProjectsState> {
  GetProjectsCubit() : super(const GetProjectsState.loading());
  static GetProjectsCubit get(BuildContext context)=>BlocProvider.of<GetProjectsCubit>(context);
  int? loadOrEmitSuccess(String projectId){
    if(state is GetProjectsSuccess){
    int index = state.maybeWhen<List<Project>>(orElse: ()=>[],success: (p)=>p).indexWhere((e)=>e.path==projectId);
    if(index == -1) return null;
    return index;
    }
    getData();
    return null;
  }
  getData({bool reload = false,String? path}) async {
    try{
    if(reload) emit(GetProjectsState.loading());
    final projects = await getProjectsFromFirebase();

    emit(GetProjectsState.success(projects));
    } on ExceptionImpl catch(e){
      emit(GetProjectsState.error(e));
    }
  }
}
