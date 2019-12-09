import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'web_action.dart';
import 'web_state.dart';

Widget buildView(
    WebLoadState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: WebView(
      initialUrl: state.url,
      javascriptMode: JavascriptMode.unrestricted,
    ),
  );
}
