import 'package:flutter/material.dart';

class simpleState extends StatefulWidget {
  @override
  _StatesimpleState createState() => _StatesimpleState();
}

class _StatesimpleState extends State<simpleState> {
  var angka = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Class'),
      ),
      body: Center(
        child: Text('Angka sekarang $angka'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          print("I'm pressed");
          setState(() {
            angka += 1;
          });
        },
      ),
    );
  }
}
