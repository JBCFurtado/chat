part of 'chat.dart';

Widget widgetMessage(Message message) {
  if (message.id == 'server') {
    return Bubble(
      margin: BubbleEdges.all(6),
      alignment: Alignment.center,
      color: Colors.cyan,
      child: Column(
        
        children: [
          Text(
            '${message.time} - ${message.username}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            message.text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  return Bubble(
    margin: BubbleEdges.all(6),
    alignment: message.eu ? Alignment.topRight : Alignment.topLeft,
    nipWidth: 8,
    nipHeight: 24,
    nip: message.eu ? BubbleNip.rightTop : BubbleNip.leftTop,
    color: message.eu ? Colors.yellow[300] : Colors.yellow[700],
    child: Column(
      crossAxisAlignment:
          message.eu ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          '${message.time} - ${message.username}',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(message.text, textAlign: TextAlign.justify),
      ],
    ),
  );
}
