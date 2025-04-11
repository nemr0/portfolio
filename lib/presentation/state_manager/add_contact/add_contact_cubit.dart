import 'dart:developer';

import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/data/models/contact/contact.dart';
import 'package:portfolio/domain/local_source/local_database_abstract.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';

part 'add_contact_state.dart';

part 'add_contact_cubit.freezed.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit( {required this.baasService, required this.localDatabase})
    : super(const AddContactState.initial()){
    _init();
  }
  _init(){
    final didContact = localDatabase.getDidContact();
    if(didContact == true){
      emit(const AddContactState.saved());
    }
  }
  final BAASService baasService;
  final LocalDatabase localDatabase;
  static AddContactCubit get(BuildContext context) =>
      BlocProvider.of<AddContactCubit>(context);
  sendAgain(){
    localDatabase.setDidContact(false);
    emit(AddContactState.initial(focus: true));
  }
  addContact(Contact contact) async {
    try {
      if (state is AddContactLoading) return;
      if(localDatabase.getDidContact() == true){
        emit(const AddContactState.saved());
        return;
      }
      emit(const AddContactState.loading());
      await baasService.addContact(contact: contact);
      emit(const AddContactState.success());
      localDatabase.setDidContact(true);
    } catch (e,s) {
      log(e.toString());
      log(s.toString());

      emit(const AddContactState.failed());
      return;
    }
  }
}
