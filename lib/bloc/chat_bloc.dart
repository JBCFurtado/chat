import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {


  final IO.Socket _socket = IO.io('https://karlaycosta.com.br', <String, dynamic>{
    'transports': ['websocket'],
  });
  ChatBloc() : super(ChatInitial()){
    _socket.on('connect_error', (error){
      print('Error: $error');
    });

    _socket.on('connect', (_){
      print('Conectado...');
    });
    _socket.on('disconnect', (_){
      print('Desconectado...');
    });
  }

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
