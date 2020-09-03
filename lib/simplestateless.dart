import 'package:flutter/material.dart';

class simpleStateless  extends StatelessWidget {

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
          angka += 1;
        },
      ),
    );
  }
}
