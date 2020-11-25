import 'package:flutter/material.dart';

class User {
  final String id;
  final String username;
  final String room;

  const User({@required this.id, @required this.username, this.room = 'Aula'});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        room = json['room'];
        
  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'room': room};
}
