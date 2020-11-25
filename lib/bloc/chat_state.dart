part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class EstadoConectado extends ChatState {}

class EstadoDesconectado extends ChatState {}


class EstadoMensagemRecebida extends ChatState {
  final Message msg;

  EstadoMensagemRecebida(this.msg);
  @override
  List<Object> get props => [msg];
}
