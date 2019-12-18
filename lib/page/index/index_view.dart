import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/page/index/index_action.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'index_state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
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
    controller: state.mRefreshController,
    onRefresh: () {
      dispatch(IndexActionCreator.onRefresh());
    },
    onLoading: () {
      dispatch(IndexActionCreator.onLoadMore());
    },
    child: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: viewService.buildComponent('banner'),
        ),
        SliverToBoxAdapter(
          child: viewService.buildComponent('classify'),
        ),
        SliverToBoxAdapter(
          child: viewService.buildComponent('hotArticle'),
        ),
      ],
    ),

  ));
}
