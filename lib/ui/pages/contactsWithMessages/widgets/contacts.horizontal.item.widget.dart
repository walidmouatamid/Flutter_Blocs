import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactHorizontalItemWidget extends StatelessWidget {
  Contact contact;
  int index;
  ContactHorizontalItemWidget({this.contact, this.index,this.scrollController});
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          context.read<MessagesBloc>().add(new MessagesByContactEvent(contact));
          scrollController.animateTo((this.index*200-150).toDouble(), duration: Duration(microseconds: 2000), curve: Curves.ease);
        },
        child: BlocBuilder<MessagesBloc,MessageState>(
          builder: (context, messagesState ) => Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(16),
              width: 140,
              child: Column(children: [
                CircleAvatar(
                  child: Text('${contact.profile}'),
                ),
                Text('${contact.name}'),
                Text('${contact.score}'),
              ]),
              decoration: BoxDecoration(
                border: Border.all(
                    width: (messagesState.currentContact==contact)?3:1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
