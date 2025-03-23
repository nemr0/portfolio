import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/data/models/exceptions/exception_abs.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';

part 'get_projects_state.dart';
part 'get_projects_cubit.freezed.dart';

class GetProjectsCubit extends Cubit<GetProjectsState> {
  GetProjectsCubit(this.baasService) : super(const GetProjectsState.loading());
  final BAASService baasService;
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
   // PocketBaseService().a();

    try{
    if(reload) emit(GetProjectsState.loading());
    final projects = await baasService.getProjects();

    emit(GetProjectsState.success(projects));
    } on ExceptionImpl catch(e){
      emit(GetProjectsState.error(e));
    }
  }
}
