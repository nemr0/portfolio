import 'dart:developer';

import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/data/models/contact/contact.dart';
import 'package:portfolio/domain/remote_source/database/baas_database_abstract.dart';

part 'add_contact_state.dart';

part 'add_contact_cubit.freezed.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit({required this.baasService})
    : super(const AddContactState.initial());
  final BAASService baasService;
  static AddContactCubit get(BuildContext context) =>
      BlocProvider.of<AddContactCubit>(context);

  addContact(Contact contact) async {
    try {
      emit(const AddContactState.loading());
      await baasService.addContact(contact: contact);
      emit(const AddContactState.success());
    } catch (e,s) {
      log(e.toString());
      log(s.toString());
      emit(const AddContactState.failed());
      return;
    }
  }
}
