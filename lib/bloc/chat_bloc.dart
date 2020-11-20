import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {

  bool _conectado = false;

  bool get conectado => _conectado;


  final IO.Socket _socket = IO.io('https://karlaycosta.com.br', <String, dynamic>{
    'transports': ['websocket'],
  });
  ChatBloc() : super(ChatInitial()){
    _socket.on('connect_error', (error){
      print('Error: $error');
    });

    _socket.on('connect', (_){
      print('Conectado...');
      add(EventoConectado());
    });
    _socket.on('disconnect', (_){
      print('Desconectado...');
      add(EventoDesconectado());
    });
  }

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    // Toda: implementão aqui do mapEventToState.
    if (event is EventoConectado){
      _conectado = true;
      yield EstadoConectado();
    } else if (event is EventoDesconectado){
      _conectado = false;
      yield EstadoDesconectado();
    }
  }
}
