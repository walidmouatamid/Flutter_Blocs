import 'package:contacts_bloc_app/bloc/contacts.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ErrorRetryMessages extends StatelessWidget {
  String errorMessage;
  Function onAction;

  ErrorRetryMessages({this.errorMessage, this.onAction});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${errorMessage}'),
        RaisedButton(
          onPressed: onAction,
          child: Text('Retry',style: TextStyle(color: Colors.white),),
          color: Colors.teal,
        ),

      ],
    );
  }
}
