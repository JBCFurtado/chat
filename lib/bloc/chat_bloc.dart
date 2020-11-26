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

  User _user;
  User get user => _user;

  List<User> _users = [];
  List<User> get users => _users;

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
      if (_user != null) {
        add(EventoEntrar(_user.username));
      }
    });
    _socket.on('disconnect', (_) {
      print('Desconectado...');
      add(EventoDesconectado());
    });

    _socket.on('_msg', (data) {
      print('MSG: $data');
      add(EventoReceberMensagem(Message.fromJson(data)));
    });

    _socket.on('roomUsers', (data) {
      print('USERS: $data');
      List lista = data['users'];
      add(EventoReceberUsuarios(lista.map((e) => User.fromJson(e)).toList()));
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
    } else if (event is EventoEntrar) {
      _user = User(id: _socket.id, username: event.username);
      _socket.emit('joinRoom', _user.toJson());
    } else if (event is EventoSair) {
      _user = null;
      _socket.emit('leaveRoom', {});
    } else if (event is EventoReceberMensagem) {
      yield EstadoMensagemRecebida(event.msg);
    } else if (event is EventoReceberUsuarios){
      _users = event.users;
      yield EstadoRecebendoUsuarios();
    }
  }
}
