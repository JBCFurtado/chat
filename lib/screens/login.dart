import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();// 5 aula
  final _controller= TextEditingController();
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
                  'Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 300,
                  child: Form(
                    key: _formKey,
                      child: TextFormField(
                        controller: _controller,
                        validator: (valor){
                          if (valor.isEmpty){
                            return'Você deve informar um nome!';
                          }
                          return null;
                        },
                       decoration: InputDecoration(
                          hintText: 'Informe seu nome',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.account_box),
                          errorStyle: TextStyle(
                            fontSize: 18,
                          ),
                            ),
                          ),
                  ),
                      ),
                    SizedBox(
                      height: 12,
                    ),
                     
                   
                RaisedButton(
                  onPressed: () {
                      if (_formKey.currentState.validate()){
                        Navigator.pushNamedAndRemoveUntil(context, '/chat', (route) => false);
                      } else{
                        print('Não Ok!');
                      }
                    
                  },
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
