import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.forum,
                  //Icons.ac_unit,
                  //Icons.filter_vintage,
                  size: 90,
                  color: Colors.cyan[900],
                ),
                Text(
                  'UberCat',
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      
                    ],
                    color: Colors.cyan[900],
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 350,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (valor) {
                        if (valor.isEmpty) {
                          return 'O campo está vazio!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Informe seu nome',
                        filled: true,
                        fillColor: Colors.white70,
                        suffixIcon: Icon(Icons.account_box),
                        errorStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('ok');
                    } else {
                      print('Nao ok');
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10.0,
                  color: Colors.cyan[900],
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
                        width: 12,
                      ),
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
