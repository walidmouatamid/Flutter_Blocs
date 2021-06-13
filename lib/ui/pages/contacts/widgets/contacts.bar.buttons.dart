import 'package:contacts_bloc_app/bloc/contacts.actions.dart';
import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ContactBarButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(buttonLabel: 'All Contacts',contactsEvent: new LoadAllContactsEvent(),),
          ContactsButtonItem(buttonLabel: 'Students',contactsEvent: new LoadStudentEvent(),),
          ContactsButtonItem(buttonLabel: 'Developers',contactsEvent: new LoadDeveloperEvent(),)

        ],
      ),
    );
  }
}
