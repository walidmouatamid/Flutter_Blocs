import 'package:contacts_bloc_app/bloc/messages/messages.bloc.dart';
import 'package:contacts_bloc_app/bloc/messages/messages.state.dart';
import 'package:contacts_bloc_app/enums/enums.dart';
import 'package:contacts_bloc_app/ui/shared/circular.progress.ind.widget.dart';
import 'package:contacts_bloc_app/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'messages.list.widget.dart';
class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MessagesBloc,MessageState>(
          builder: (context,state){
            if(state.requestState==RequestState.LOADING){
              return MyCircularProgressIndWidget();
            }
            else if(state.requestState==RequestState.ERROR){
              return ErrorRetryMessages(errorMessage: state.messageError,
                onAction: (){
                  context.read<MessagesBloc>().add(state.currentMessageEvent);
                },);
            }else if(state.requestState==RequestState.LOADED){
              return MessagesListWidget(state.messages);
            }else{
              return Container();
            }

          }
      ),
    );
  }
}
