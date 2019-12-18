import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/widget/LoadPage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'user_point_action.dart';
import 'user_point_state.dart';

Widget buildView(
    UserPointState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();

  /// 渲染主页面
  Widget _renderContainer() {
    return state.pageNum == 1 && state.pointCell.isEmpty == true
        ? LoadPage(
            mColor: state.themeColor,
          )
        : ListView.separated(
            itemBuilder: _listAdapter.itemBuilder,
            itemCount: _listAdapter.itemCount,
            separatorBuilder: (BuildContext context, int index) {
              if (index != 0) {
                return Divider();
              } else {
                return Container();
              }
            },
          );
  }

  return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: state.themeColor,
        title: Text(
          '积分',
          style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
        ),
        elevation: 0,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          backgroundColor: state.themeColor,
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: state.refreshController,
        onRefresh: () {
          dispatch(UserPointActionCreator.onRefresh());
        },
        onLoading: () {
          dispatch(UserPointActionCreator.onLoadmore());
        },
        child: _renderContainer(),
      ));
}
