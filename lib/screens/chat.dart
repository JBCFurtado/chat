import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget_enviar.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ChatBloc _bloc = context.watch<ChatBloc>();
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ChatBloc, ChatState>(
            buildWhen: (previousState, state) {
              return state is EstadoConectado || state is EstadoDesconectado;
            },
            builder: (context, state) {
              return Text(_bloc.conectado ? _bloc.user.username : 'Desconectado');
            },
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.people),
            onPressed: () => Navigator.pushNamed(context, '/usuarios'),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _showMyDialog(context),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(color: Colors.yellow,),
              ),
            widgetEnviar(),
          ],),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Atenção!',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Você deseja sair do Chat?',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                context.read<ChatBloc>().add(EventoSair());
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
            ),
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
