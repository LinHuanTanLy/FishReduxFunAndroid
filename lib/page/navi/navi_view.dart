import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/NaviTreeBean.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';

import 'navi_action.dart';
import 'navi_state.dart';

Widget buildView(NaviState state, Dispatch dispatch, ViewService viewService) {
  /// 渲染左侧item
  Widget _renderLeftItem(NaviCellBean naviCellBean) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: state.currIndex == naviCellBean.cid
                ? ColorConf.ColorF6f6f6
                : ColorConf.ColorFFFFFF,
            border: Border(
                right: BorderSide(
              color: ColorConf.ColorF6f6f6,
            ))),
        child: Text(naviCellBean.name),
      ),
      onTap: () {
        dispatch(NaviActionCreator.onClickLeftItem(naviCellBean?.cid));
      },
    );
  }

  /// 渲染左侧列表
  List<Widget> _renderLeft() {
    return state?.listForNavi?.map((e) => _renderLeftItem(e))?.toList();
  }

  ///渲染优测item
  Widget _renderItemCell(Articles children) {
    return GestureDetector(
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: state.themeColor),
        child: Text(
          children?.title,
          style: TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
        ),
      ),
      onTap: () {
        dispatch(NaviActionCreator.onToWebView(
            {"title": children?.title, "url": children?.link}));
      },
    );
  }

  return Scaffold(
    appBar: LyAppBar.getAppBar(state?.themeColor, '导航数据'),
    body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: _renderLeft()),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                spacing: 10,
                runAlignment: WrapAlignment.center,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: state?.listForNavi?.isNotEmpty == true
                    ? state?.listForNavi
                        ?.firstWhere((e) => e.cid == state?.currIndex)
                        ?.articles
                        ?.map((e) => _renderItemCell(e))
                        ?.toList()
                    : <Widget>[],
              ),
              margin: const EdgeInsets.only(left: 10, top: 10),
            ),
          ),
          flex: 3,
        ),
      ],
    ),
  );
}
