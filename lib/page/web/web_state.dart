import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebLoadState implements GlobalBaseState, Cloneable<WebLoadState> {
  String url;
  String title;
  dynamic id;
  bool ifCollect = false;
  FlutterWebviewPlugin flutterWebviewPlugin;

  @override
  WebLoadState clone() {
    return WebLoadState()
      ..url = url
      ..title = title
      ..themeColor = themeColor
      ..flutterWebviewPlugin = flutterWebviewPlugin
      ..id = id
      ..ifCollect = ifCollect;
  }

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;

  @override
  int userPoint;
}

WebLoadState initState(Map<String, dynamic> args) {
  debugPrint('the args is ${args}');
  debugPrint('the collect is ${args['collect']}');
  return WebLoadState()
    ..url = args['url']
    ..id = args['id']
    ..ifCollect = args['collect'] ?? false
    ..flutterWebviewPlugin = FlutterWebviewPlugin()
    ..title = args['title'];
}
