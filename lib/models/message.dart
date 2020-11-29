class Message {
  final String id;
  final String username;
  final String text;
  final String time;
  final bool eu;

  const Message({this.id, this.username, this.text, this.time, this.eu = false});

  Message.fromJson(Map<String, dynamic> json, {bool eu = false})
      : id = json['id'],
        username = json['username'],
        text = json['text'],
        time = json['time'],
        eu = eu;

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'text': text, 'time': time};
}
