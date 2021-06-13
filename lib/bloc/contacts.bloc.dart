import 'package:bloc/bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/repositories/contact.repository.dart';

import 'contacts.actions.dart';
import 'contacts.state.dart';

class ContactsBloc extends Bloc<ContactsEvent,ContactsState>{
ContactRepository contactRepository;
MessagesBloc messagesBloc;
  ContactsBloc({ContactsState initialState, this.contactRepository,this.messagesBloc}) : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if(event is LoadAllContactsEvent){
      yield ContactsState(contacts: state.contacts,requestState:RequestState.LOADING,currentEvent: event);
      try {
        List<Contact>data=await contactRepository.AllContacts();
        yield ContactsState(contacts: data,requestState: RequestState.LOADED,currentEvent: event,currentContact: data[0]);
        messagesBloc.add(new MessagesByContactEvent(data[0]));
      } catch (e) {
        yield ContactsState(contacts: state.contacts,requestState: RequestState.ERROR,errorMessage: e.message,currentEvent: event);
      }
    }else if(event is LoadStudentEvent){
      yield ContactsState(contacts: state.contacts,requestState:RequestState.LOADING,currentEvent: event);
      try {
        List<Contact>data=await contactRepository.contactByType("Student");
        yield ContactsState(contacts: data,requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts,requestState: RequestState.ERROR,errorMessage: e.message,currentEvent: event);
      }
    }else if(event is LoadDeveloperEvent){
      yield ContactsState(contacts: state.contacts,requestState:RequestState.LOADING,currentEvent: event);
      try {
        List<Contact>data=await contactRepository.contactByType("Developer");
        yield ContactsState(contacts: data,requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts,requestState: RequestState.ERROR,errorMessage: e.message,currentEvent: event);
      }
    }
    throw UnimplementedError();
  }

}