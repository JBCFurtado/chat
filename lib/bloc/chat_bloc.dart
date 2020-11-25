import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  bool _conectado = false;

  bool get conectado => _conectado;

  final IO.Socket _socket =
      IO.io('https://karlaycosta.com.br', <String, dynamic>{
    'transports': ['websocket'],
  });
  ChatBloc() : super(ChatInitial()) {
    _socket.on('connect_error', (error) {
      print('Error: $error');
    });

    _socket.on('connect', (_) {
      print('Conectado...');
      add(EventoConectado());
    });
    _socket.on('disconnect', (_) {
      print('Desconectado...');
      add(EventoDesconectado());
    });

    _socket.on('_msg', (data) {
      print('MSG: $data');
      add(EventoReceberMensagem(Message.fromJson(data)));
    });    
  }

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is EventoConectado) {
      _conectado = true;
      yield EstadoConectado();
    } else if (event is EventoDesconectado) {
      _conectado = false;
      yield EstadoDesconectado();
    } else if (event is EventoEntrar){
      User user = User(id: _socket.id, username: event.username);
      _socket.emit('joinRoom', user.toJson());
    } else if (event is EventoSair) {
      _socket.emit('leaveRoom', {});
    } else if (event is EventoReceberMensagem){
      yield EstadoMensagemRecebida(event.msg);
    }
  }
}
