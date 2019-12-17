import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 通用加载页面
class LoadPage extends StatefulWidget {
  final Color mColor;

  const LoadPage({Key key, this.mColor}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitWave(
      color: widget?.mColor,
      size: 50.0,
    ));
  }
}
