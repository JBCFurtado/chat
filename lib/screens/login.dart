import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // 5 aula
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('BUILD: Login');
    // ignore: close_sinks
    final ChatBloc _bloc = BlocProvider.of<ChatBloc>(context);
    return BlocListener<ChatBloc, ChatState>(
      listenWhen: (previousState, state) {
        return state is EstadoMensagemRecebida;
      },
      listener: (context, state) {
        if (state is EstadoMensagemRecebida) {
          if (state.msg.id == 'server' &&
              state.msg.text == 'Bem vindo ao chat!') {
            Navigator.pushNamedAndRemoveUntil(
                context, '/chat', (route) => false);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.yellow[800],
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.fingerprint,
                    size: 90,
                    color: Colors.cyan[900],
                  ),
                  Text(
                  'The Intercept_',
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      
                    ],
                    color: Colors.cyan[900],
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'Brasil',
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      
                    ],
                    color: Colors.cyan[900],
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 320,
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
                          fillColor: Colors.white70,
                          suffixIcon: Icon(Icons.account_box),
                          errorStyle: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (_bloc.conectado) {
                          _bloc.add(EventoEntrar(_controller.text));
                        } else {
                          _aviso(context);
                        }
                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.cyan[900],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          '  Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        
                      ],
                    ),
                  ),
                  BlocBuilder<ChatBloc, ChatState>(
                      buildWhen: (previousState, state) {
                    return state is EstadoConectado ||
                        state is EstadoDesconectado;
                  }, builder: (context, state) {
                    if (_bloc.conectado) {
                      return Text('...',
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 35));
                    }
                    return Text('...',
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 35));
                  })
                ],
              ),
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
