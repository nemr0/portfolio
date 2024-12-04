import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

part 'add_project_state.dart';
part 'add_project_cubit.freezed.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit() : super(const AddProjectState.initial());
  Project project=emptyProject;
  onFirstTapCompleted(){

  }
}
