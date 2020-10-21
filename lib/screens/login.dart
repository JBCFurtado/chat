import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SingleChildScrollView(
          child: Center(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.chat,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  'Jobs Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 335,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite seu nome',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.account_box),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {
                    print('Somente teste');
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.blueGrey[900],
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

              // color: Colors.red,
              ),
        ));
  }
}
