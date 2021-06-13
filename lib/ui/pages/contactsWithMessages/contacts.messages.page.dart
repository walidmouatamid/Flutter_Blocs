import 'package:contacts_bloc_app/bloc/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/bloc/contacts.state.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/ui/pages/contactsWithMessages/widgets/contacts.list.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.app.bar.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.widget.dart';
import 'package:contacts_bloc_app/ui/shared/circular.progress.ind.widget.dart';
import 'package:contacts_bloc_app/ui/shared/error.retry.action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsWithMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return BlocBuilder<MessagesBloc,MessageState>(
      builder: (context, state) => Scaffold(
          appBar: MyAppBarWidget(state.currentContact),
          body:Column(
            children: [
              ContactListHorizontalWidget(),
              MessagesWidget(),
              MessagesFormWidget(state.currentContact),

            ],
          )

      ),
    );
  }
}
