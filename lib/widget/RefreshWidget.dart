import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'LoadPage.dart';

/// 刷新控件
class RefreshWidget extends StatefulWidget {
  /// 主题颜色
  final Color themeColor;

  /// 刷新控制器
  final RefreshController refreshController;

  /// 刷新回调
  final Function onRefresh;

  /// 加载回调
  final Function onLoadMore;

  /// 页标
  final int pageNum;

  /// 适配器
  final ListAdapter listAdapter;

  /// 默认下标  因为有些是从0开始 有些从1 开始 默认1  0的话就要自己传进来了
  final int defIndex;

  /// 是否需要下划线
  final bool ifNeedSeparated;

  RefreshWidget(this.themeColor, this.refreshController, this.pageNum,
      this.listAdapter, this.onRefresh, this.onLoadMore,
      {this.defIndex, this.ifNeedSeparated = true});

  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget?.onRefresh != null,
      enablePullUp: widget?.onLoadMore != null,
      header: WaterDropMaterialHeader(
        backgroundColor: widget?.themeColor,
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
      controller: widget?.refreshController ?? RefreshController(),
      onRefresh: widget?.onRefresh,
      onLoading: widget?.onLoadMore,
      child: _renderContainer(),
    );
  }

  /// 渲染主页面
  Widget _renderContainer() {
    return widget.pageNum == (widget?.defIndex ?? 1) &&
            widget?.listAdapter?.itemCount == 0
        ? LoadPage(
            mColor: widget?.themeColor,
          )
        : _initListView();
  }

  /// 渲染listView 根据需求是否是带分割线
  ListView _initListView() {
    if (widget.ifNeedSeparated) {
      return ListView.separated(
        itemBuilder: widget?.listAdapter?.itemBuilder,
        itemCount: widget?.listAdapter?.itemCount,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      );
    } else {
      return ListView.builder(
        itemBuilder: widget?.listAdapter?.itemBuilder,
        itemCount: widget?.listAdapter?.itemCount,
      );
    }
  }
}
