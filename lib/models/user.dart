import 'package:flutter/material.dart';

class User {
  final String id;
  final String username;
  final String room;
  final bool site;

  const User({@required this.id, @required this.username, this.room = 'Aula', this.site});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        room = json['room'],
        site = json['site'];
        
  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'room': room};
}
