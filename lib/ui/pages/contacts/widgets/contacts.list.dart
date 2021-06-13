import 'package:contacts_bloc_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ContactsList extends StatelessWidget {
  List<Contact>contacts;
  ContactsList({this.contacts});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index)=> Divider(height: 2,color: Colors.teal,),
      itemCount: contacts.length,
      itemBuilder: (context,index){
        return ListTile(
          onTap: (){
            Navigator.pushNamed(context, "/messages",arguments: contacts[index]);
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                CircleAvatar(child: Text('${contacts[index].profile}'),backgroundColor: Colors.deepOrange,),
                SizedBox(width: 16,),
                Text('${contacts[index].name}')
              ]),
              CircleAvatar(child: Text('${contacts[index].score}'),)
            ],
          ),
        );
      },

    );
  }
}
