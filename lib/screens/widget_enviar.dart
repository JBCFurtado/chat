part of 'chat.dart';

Widget widgetEnviar(ChatBloc bloc) {
  final _controll = TextEditingController();
  return Container(
    padding: EdgeInsets.all(8),
    color: Colors.blueGrey,
    child: Row(
      children: [
        Expanded(
            child: TextField(
          onSubmitted: (text) {
            if (text.isNotEmpty) {
              bloc.add(EventoEnviarMensagem(_controll.text));
              _controll.clear();
            }
          },
          controller: _controll,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Envie sua mensagem...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
        )),
        IconButton(
          icon: Icon(Icons.send),
          color: Colors.white,
          onPressed: () {
            if (_controll.text.isNotEmpty) {
              bloc.add(EventoEnviarMensagem(_controll.text));
              _controll.clear();
            }
            FocusManager.instance.primaryFocus.unfocus();
          },
        ),
      ],
    ),
  );
}
