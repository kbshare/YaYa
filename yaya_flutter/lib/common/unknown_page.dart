import 'package:flutter/material.dart';

class UnKnownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('迷路返回'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Center(
          child: Text('迷路了'),
        ),
      ),
    );
  }
}
