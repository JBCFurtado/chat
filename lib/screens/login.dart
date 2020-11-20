import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 5 aula
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ChatBloc _bloc = context.watch<ChatBloc>();
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.chat,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 300,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _controller,
                      validator: (valor) {
                        if (valor.isEmpty) {
                          return 'Você deve informar um nome!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Informe seu nome',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.account_box),
                        errorStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (_bloc.conectado) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/chat', (route) => false);
                      } else {
                        _aviso(context);
                      }
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.blueGrey[900],
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ChatBloc, ChatState>(
                    buildWhen: (previousState, state) {
                  return state is EstadoConectado ||
                      state is EstadoDesconectado;
                }, builder: (context, state) {
                  if (state is EstadoConectado) {
                    return Text('Conectado',
                        style:
                            TextStyle(color: Colors.greenAccent, fontSize: 18));
                  }
                  return Text('Desconectado',
                      style: TextStyle(color: Colors.redAccent, fontSize: 18));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _aviso(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(Icons.wifi_off, size: 64, color: Colors.redAccent),
          content: Text(
            'Você está sem conexão!',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
