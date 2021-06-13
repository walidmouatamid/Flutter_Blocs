import 'package:contacts_bloc_app/bloc/messages/messages.actions.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/contacts.info.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.app.bar.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.widget.dart';
import 'package:contacts_bloc_app/ui/shared/circular.progress.ind.widget.dart';
import 'package:contacts_bloc_app/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MessagesPage extends StatelessWidget {
  Contact contact;
  @override
  Widget build(BuildContext context) {
    this.contact=ModalRoute.of(context).settings.arguments;
    context.read<MessagesBloc>().add(MessagesByContactEvent(this.contact));
    return Scaffold(
      appBar:MyAppBarWidget(this.contact),
      body: Column(
        children: [
         ContactInfoWidget(contact),
          MessagesWidget(),
          MessagesFormWidget(contact)
        ],
      ),
    );
  }
}
