import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Usuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ChatBloc _bloc = context.watch<ChatBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: ListView.separated(
        itemCount: _bloc.users.length,
        itemBuilder: (_, int index) {
          bool eu = _bloc.user.id == _bloc.users[index].id;
          return ListTile(
            leading: Icon(_bloc.users[index].site ? Icons.account_circle : Icons.phonelink_ring),
            title: Text(_bloc.users[index].username),
            subtitle: eu ? Text('Eu') : null,
          );
        }, 
        separatorBuilder: (_, index) => Divider(),
      ),
    );
  }
}
