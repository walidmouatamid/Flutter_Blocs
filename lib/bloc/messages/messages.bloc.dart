

import 'package:bloc/bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/messages.model.dart';
import 'package:contacts_bloc_app/repositories/messages.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesBloc extends Bloc<MessageEvent,MessageState>{
  MessagesRepository messagesRepository;
  MessagesBloc({@required MessageState initialState,@required this.messagesRepository}) : super(initialState);

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if(event is MessagesByContactEvent){
      yield MessageState(requestState: RequestState.LOADING,messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: event.payload);
      try {
        List<Message> data =await messagesRepository.messagesByContact(event.payload.id);
        yield MessageState(requestState: RequestState.LOADED,messages: data,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: event.payload);
      } catch (e) {
        yield MessageState(requestState: RequestState.ERROR,messageError: e.toString(),messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: event.payload);
      }
    }else if(event is AddNewMessageEvent){
     // yield MessageState(requestState: RequestState.LOADING,messages: state.messages,currentMessageEvent: event);
      try {
        event.payload.date=DateTime.now();
        Message message =await messagesRepository.addNewMessage(event.payload);
        List<Message> data=[...state.messages];
        data.add(message);
        yield MessageState(requestState: RequestState.LOADED,messages: data,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: state.currentContact);
      } catch (e) {
        yield MessageState(requestState: RequestState.ERROR,messageError: e.toString(),messages: state.messages,currentMessageEvent: event,selectedMessages: state.selectedMessages,currentContact: state.currentContact);
      }
    }else if(event is SelectMessageEvent){
      List<Message> messages=state.messages;
      List<Message> selected=[...state.selectedMessages];
      for(Message m in messages){
        if(m.id==event.payload.id){
          m.selected=!m.selected;
        }
        if(m.selected==true){
          selected.add(m);
        }else{
          selected.removeWhere((element) => element.id==m.id);
        }
      }
      MessageState messageState=MessageState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.LOADED,currentContact: state.currentContact);
      yield messageState;
    }
    else if(event is DeleteMessagesEvent){
      List<Message> messages=state.messages;
      List<Message> selected=[...state.selectedMessages];
      for(Message m in selected){
       try {
         await messagesRepository.deleteMessage(m);
         messages.removeWhere((element) => element.id==m.id);
         MessageState messageState=MessageState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.LOADED,currentContact: state.currentContact);
         yield messageState;
       } catch (e) {
         MessageState messageState=MessageState(messages: messages,selectedMessages: selected,currentMessageEvent: event,requestState: RequestState.ERROR,currentContact: state.currentContact);
         yield messageState;
       }
      }

    }
  }
  
}