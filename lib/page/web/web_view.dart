import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/widget/LoadPage.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';

//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'web_action.dart';
import 'web_state.dart';

Widget buildView(
    WebLoadState state, Dispatch dispatch, ViewService viewService) {
  return WebviewScaffold(
    appBar: LyAppBar.getAppBar(state.themeColor, '${state.title}'),
    withZoom: true,
    withLocalStorage: true,
    hidden: true,
    initialChild: Container(
        child: LoadPage(
      mColor: state.themeColor,
    )),
    url: state.url,
  );
}
