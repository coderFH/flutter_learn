import 'package:flutter/material.dart';

class MyDecoratedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBox'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]]),
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0
              ),
            ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 18.0
            ),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

