import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_cubit/src/features/contact/cubit/contact_repository.dart';
import 'package:json_cubit/src/features/contact/models/contact_model.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  Future<void> getContactData() async {
    emit(ContactLoading());
    ContactRepository _contactRepository = ContactRepository();//created an object of ContactRepository
    List<ContactModel> contactList = await _contactRepository.getContactsData();//
    emit(ContactLoaded(contactList));
  }
}