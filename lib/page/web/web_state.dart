import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';

class WebLoadState implements GlobalBaseState,Cloneable<WebLoadState> {
  String url;
  String title;

  @override
  WebLoadState clone() {
    return WebLoadState()
      ..url = url
      ..title = title;
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
  return WebLoadState()
    ..url = args['url']
    ..title = args['title'];
}
