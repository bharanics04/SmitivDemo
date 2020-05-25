import 'package:flutter/material.dart';

class CustomProgress extends StatefulWidget {
  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Center(child: Text("Smitiv"),)),
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
