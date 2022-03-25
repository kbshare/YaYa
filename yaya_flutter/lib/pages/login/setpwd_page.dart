
import 'package:flutter/material.dart';
class SetPwdPage extends StatefulWidget {
  @override
  _SetPwdPageState createState() => _SetPwdPageState();
}

class _SetPwdPageState extends State<SetPwdPage> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: Text('设置密码'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Center(
          child: Text('设置密码'),
        ),
      ),
    );
  }
}