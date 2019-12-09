import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'web_action.dart';
import 'web_state.dart';

Widget buildView(
    WebLoadState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '${state.title}',
        style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
      ),
      iconTheme: IconThemeData(color: ColorConf.ColorFFFFFF),
      actions: <Widget>[
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                value: 'share',
                child: Row(
                  children: <Widget>[
                    Icon(Icons.share, color: ColorConf.Color48586D),
                    Text(
                      '分享',
                      style:
                          TextStyle(fontSize: 14, color: ColorConf.Color48586D),
                    )
                  ],
                ),
              )
            ];
          },
//          color: Color(0xcc000000),
          offset: Offset(60, 60),
        )
      ],
    ),
    body: Container(
      child: WebView(
        initialUrl: state.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ),
  );
}
