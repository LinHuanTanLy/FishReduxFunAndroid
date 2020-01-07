import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlTextWidget extends StatelessWidget {
  final String msg;
  final Color color;

  const HtmlTextWidget({Key key, this.msg,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: msg,
      defaultTextStyle: TextStyle(fontSize: 15, color: color??Colors.black),
    );
  }
}
