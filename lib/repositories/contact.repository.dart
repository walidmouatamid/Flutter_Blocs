import 'dart:math';

import 'package:contacts_bloc_app/main.dart';
import 'package:contacts_bloc_app/model/contact.model.dart';

class ContactRepository{
  Map<int,Contact> contacts={
    1:Contact(id:1,name:'Mohamed',profile:'MO',score:1234,type:'Student'),
    2:Contact(id:2,name:'Yassine',profile:'YA',score:432,type:'Developer'),
    3:Contact(id:3,name:'Fayrouz',profile:'FA',score:654,type:'Student'),
    4:Contact(id:4,name:'Oumaima',profile:'OU',score:654,type:'Developer'),
    5:Contact(id:5,name:'Salma',profile:'SA',score:654,type:'Student'),

  };
  Future<List<Contact>> AllContacts() async{
    var future=await Future.delayed(Duration(seconds: 1));
    int rnd=new Random().nextInt(10);
    if(rnd>1){
      return contacts.values.toList();
    }else{
      throw new Exception("Internet Error");
    }
  }

  Future<List<Contact>> contactByType(String type) async{
    var future=await Future.delayed(Duration(seconds: 1));
    int rnd=new Random().nextInt(10);
    if(rnd>1){
      return contacts.values.toList().where((element) => element.type==type).toList();
    }else{
      throw new Exception("Internet Error");
    }
  }
}