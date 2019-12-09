import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'web_action.dart';
import 'web_state.dart';

Widget buildView(
    WebLoadState state, Dispatch dispatch, ViewService viewService) {
  return WebviewScaffold(
    appBar: AppBar(
      title: Text(
        '${state.title}',
        style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
      ),
      iconTheme: IconThemeData(color: ColorConf.ColorFFFFFF),
    ),
    withZoom: true,
    withLocalStorage: true,
    hidden: true,
    initialChild: Container(
      child: const Center(
        child: Text('Waiting.....'),
      ),
    ),
    url: state.url,
  );
}
