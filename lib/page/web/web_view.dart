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
  /// 初始化单个底部item
  Widget _initIconButton(icon, callback, {bool ifCollect = false}) {
    return Expanded(
        child: IconButton(
            icon: Icon(
              icon,
              color: ifCollect
                  ? state.ifCollect ? Colors.red : ColorConf.Color48586D
                  : ColorConf.Color48586D,
            ),
            onPressed: callback));
  }

  /// 初始化底部按钮
  Widget _initBottomNavigationBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _initIconButton(Icons.arrow_back_ios, () {
            dispatch(WebLoadActionCreator.onGoBack());
          }),
          _initIconButton(Icons.arrow_forward_ios, () {
            dispatch(WebLoadActionCreator.onForward());
          }),
          _initIconButton(Icons.refresh, () {
            dispatch(WebLoadActionCreator.onGoFresh());
          }),
          _initIconButton(Icons.favorite_border, () {
            dispatch(WebLoadActionCreator.onGoLike());
          }, ifCollect: true),
        ],
      ),
      color: ColorConf.ColorF6f6f6,
    );
  }

  /// 初始化action
  List<Widget> _initAppBarAction() {
    return <Widget>[
      IconButton(
          icon: Icon(
            Icons.share,
            color: ColorConf.ColorFFFFFF,
          ),
          onPressed: () {
            dispatch(WebLoadActionCreator.onToShare());
          }),
    ];
  }

  return WebviewScaffold(
      appBar: LyAppBar.getAppBar(state.themeColor, '${state.title}',
          action: _initAppBarAction()),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
          child: LoadPage(
        mColor: state.themeColor,
      )),
      url: state.url,
      bottomNavigationBar: _initBottomNavigationBar());
}
