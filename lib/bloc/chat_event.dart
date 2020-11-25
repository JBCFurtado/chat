part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class EventoConectado extends ChatEvent {}

class EventoDesconectado extends ChatEvent {}

class EventoEntrar extends ChatEvent {
  final String username;
  EventoEntrar(this.username);
}

class EventoSair extends ChatEvent {
  
}

class EventoReceberMensagem extends ChatEvent {
  final Message msg;

  EventoReceberMensagem(this.msg);
}
