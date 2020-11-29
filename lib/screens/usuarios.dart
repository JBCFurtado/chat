import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Usuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ChatBloc _bloc = BlocProvider.of<ChatBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        buildWhen: (previousState, state) {
          return state is EstadoRecebendoUsuarios;
        },
        builder: (context, state) {
          return ListView.separated(
            itemCount: _bloc.users.length,
            itemBuilder: (_, index) {
              bool eu = _bloc.user.id == _bloc.users[index].id;
              return ListTile(
                leading: Icon(_bloc.users[index].site
                    ? Icons.account_box
                    : Icons.phonelink_ring),
                title: Text(_bloc.users[index].username),
                subtitle: eu ? Text('Você') : null,
              );
            },
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
