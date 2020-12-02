import 'package:bubble/bubble.dart';
import 'package:chat/bloc/chat_bloc.dart';
import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget_enviar.dart';
part 'widget_message.dart';

class Chat extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ChatBloc _bloc = BlocProvider.of<ChatBloc>(context);
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ChatBloc, ChatState>(
            buildWhen: (previousState, state) {
              return state is EstadoConectado || state is EstadoDesconectado;
            },
            builder: (context, state) {
              return Text(
                  _bloc.conectado ? _bloc.user.username : 'Desconectado');
            },
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.people),
              color: Colors.cyan[800],
              onPressed: () {
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.pushNamed(context, '/usuarios');
              }),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.cyan[800],
              onPressed: () => _showMyDialog(context),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 0.50,
              repeat:  ImageRepeat.repeat,
              image: AssetImage('images/01.png'),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  buildWhen: (previousState, state) {
                    return state is EstadoMensagemRecebida;
                  },
                  builder: (context, state) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      _controller.animateTo(
                        _controller.position.maxScrollExtent,
                        duration: Duration(microseconds: 300),
                        curve: Curves.easeOut
                      );
                     });
                    return ListView.builder(
                      controller: _controller,
                      itemCount: _bloc.messages.length,
                      itemBuilder: (_, index) {
                        return widgetMessage(_bloc.messages[index]);
                      },
                    );
                  },
                ),
              ),
              widgetEnviar(_bloc),
            ],
          ),
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
                FocusManager.instance.primaryFocus.unfocus();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
