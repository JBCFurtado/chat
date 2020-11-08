import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conversas'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.people),
            onPressed: () => Navigator.pushNamed(context, '/usuarios'),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _showMyDialog(context),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Atenção!', textAlign: TextAlign.center,),
        
        content: Text('Você deseja sair do Chat?', textAlign: TextAlign.center,),
        actions: <Widget>[
          TextButton(
            child: Text('Sim'),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
          TextButton(
            child: Text('Não'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
     },
    );
  }
}
