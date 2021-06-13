
import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/model/messages.model.dart';
import 'package:flutter/material.dart';

class MessageState{
  RequestState requestState;
  List<Message> messages;
  String messageError;
  MessageEvent currentMessageEvent;
  List<Message> selectedMessages=[];
  Contact currentContact;

  MessageState(
      {this.requestState,
      this.messages,
      this.messageError,
      this.currentMessageEvent,
        this.selectedMessages,
        this.currentContact
      });
  MessageState.initialState():
  requestState = RequestState.NONE,
  messages=[], messageError='',currentMessageEvent=null,
        selectedMessages=[],currentContact=new Contact();
}