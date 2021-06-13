import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/repositories/contact.repository.dart';
import 'package:contacts_bloc_app/repositories/messages.repository.dart';
import 'package:contacts_bloc_app/ui/pages/contacts/contacts.page.dart';
import 'package:contacts_bloc_app/ui/pages/contactsWithMessages/contacts.messages.page.dart';
import 'package:contacts_bloc_app/ui/pages/messages/messages.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/contacts.state.dart';
import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> MessagesBloc(
            initialState: MessageState.initialState(),
            messagesRepository: GetIt.instance<MessagesRepository>()
        )),
        BlocProvider(create: (context)=>ContactsBloc(
          initialState:
          ContactsState(
              contacts: [],errorMessage: '',requestState: RequestState.NONE),
              contactRepository: GetIt.instance<ContactRepository>(),
              messagesBloc: context.read<MessagesBloc>(),
          ),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        routes: {
          '/contacts':(context)=>ContactsPage(),
          '/messages':(context)=>MessagesPage(),
          '/contactsWithMessages':(context)=>ContactsWithMessages(),

        },
        initialRoute: '/contactsWithMessages',
      ),
    );
  }

}
