class Message {
  final String id;
  final String username;
  final String text;
  final String time;

  const Message({this.id, this.username, this.text, this.time});

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        text = json['text'],
        time = json['time'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'text': text, 'time': time};
}
