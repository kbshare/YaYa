import 'package:flutter/material.dart';
import 'discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImageName;

  const DiscoverCell({
    Key key,
    @required this.title,
    this.subTitle,
    @required this.imageName,
    this.subImageName,
  })  : assert(title != null, 'title 不能为空'),
        assert(imageName != null, 'imageName 不能为空');

  @override
  State<StatefulWidget> createState() {
    return _DiscoverCellState();
  }
}


class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DiscoverChildPage(
                  title: widget.title,
                ))); //跳转
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: _currentColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ), //图标
                  SizedBox(
                    width: 15,
                  ), //间距
                  Text(widget.title), //标题
                ],
              ),
            ), //left
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    widget.subTitle != null ? widget.subTitle : '',
                    style: TextStyle(color: Colors.grey),
                  ), //子标题
                  widget.subImageName != null
                      ? Container(
                          child: Image(
                            image: AssetImage(widget.subImageName),
                            width: 15,
                          ),
                          margin: EdgeInsets.only(left: 10, right: 10),
                        ) //小点！
                      : Container(),
                  Image(
                    image: AssetImage('images/icon_right.png'),
                    width: 15,
                  )
                ],
              ),
            ), //Right
          ],
        ),
      ),
    );
  }
}
