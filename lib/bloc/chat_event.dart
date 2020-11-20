part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class EventoConectado extends ChatEvent {}

class EventoDesconectado extends ChatEvent{}
