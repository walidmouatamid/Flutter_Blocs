import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/model/messages.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesFormWidget extends StatelessWidget {
  TextEditingController textEditingController=new TextEditingController();
  Contact contact;

  MessagesFormWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Your message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
                ),
              ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: (){
            Message message=Message(type: 'sent',contactID: contact.id,content: textEditingController.text,selected: false);
            context.read<MessagesBloc>().add(new AddNewMessageEvent(message));

            Message reply=Message(type: 'received',contactID: contact.id,content: 'Answer to '+textEditingController.text,selected: false);
            context.read<MessagesBloc>().add(new AddNewMessageEvent(reply));
            textEditingController.text='';
            },)
        ],
      )
    );
  }
}
