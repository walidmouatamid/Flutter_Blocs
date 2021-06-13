import 'package:contacts_bloc_app/model/messages.model.dart';
import 'package:contacts_bloc_app/ui/pages/messages/widgets/messages.item.widget.dart';
import 'package:flutter/material.dart';

class MessagesListWidget extends StatelessWidget {
  List<Message> messages;

  ScrollController scrollController=new ScrollController();

  MessagesListWidget(this.messages);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients)
        this.scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    return ListView.separated(
        controller: scrollController,
        itemBuilder: (context,index)=>
           MessageItemWidget(messages[index]),
        separatorBuilder: (context,index)=>Divider(color: Colors.teal,height: 2,),
        itemCount: messages.length
    );
  }
}
