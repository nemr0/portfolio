part of 'add_contact_cubit.dart';

@freezed
class AddContactState with _$AddContactState {
  const factory AddContactState.initial({@Default(false) bool focus}) = AddContactInitial;
  const factory AddContactState.saved() = AddContactSaved;
  const factory AddContactState.loading() = AddContactLoading;
  const factory AddContactState.success() = AddContactSuccess;
  const factory AddContactState.failed() = AddContactFailed;
}
