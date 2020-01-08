import 'package:flutter/material.dart';

class testPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<testPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// 实现super方法
    super.build(context);
    return Container();
  }

  /// 返回true
  @override
  bool get wantKeepAlive => true;


}
