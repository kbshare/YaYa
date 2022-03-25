import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CountController.dart';

class GetxPage extends StatefulWidget {
  final args = Get.arguments;
  final pars = Get.parameters;
  final String a = 'dd';
  @override
  _GetxPageState createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  // final count = 0.obs;
  final _countController = CountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.pars['title']),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: GetX<CountController>(
                    init: _countController,
                    initState: (_) {},
                    builder: (_) {
                      return TextButton(
                          onPressed: () {},
                          child: Text(
                            _countController.count.value.toString(),
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {
                        _countController.count.value++;
                      },
                      child: Text(
                        '点击刷新上面按钮' + _countController.count.value.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        _countController.count.value.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
