import 'package:chat/bloc/chat_bloc.dart';
import 'package:chat/screens/chat.dart';
import 'package:chat/screens/login.dart';
import 'package:chat/screens/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ChatBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Login(),
          '/chat': (context) => Chat(),
          '/usuarios': (context) => Usuarios(),
                  },
                ),
              );
            }
}
