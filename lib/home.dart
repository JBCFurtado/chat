import 'package:flutter/material.dart';
import 'screens/login.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SafeArea(child: Login())),
    );
  }
}