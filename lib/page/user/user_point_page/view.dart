import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/page/delegate/SliverAppBarDelegate.dart';

import 'state.dart';

Widget buildView(
    UserPointState state, Dispatch dispatch, ViewService viewService) {
  /// 初始化每一个tabBar的每一个item ,主要用于[_initTabBar]
  Widget _initTabItem() {
    return TabBar(
      onTap: ((index) {
        debugPrint('click item is $index');
      }),
      labelStyle: TextStyle(fontSize: 14, color: ColorConf.Color48586D),
      unselectedLabelStyle:
          TextStyle(fontSize: 14, color: ColorConf.Color18C8A1),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorConf.Color18C8A1,
      labelColor: ColorConf.Color48586D,
      unselectedLabelColor: ColorConf.ColorF6f6f6,
      tabs: state.menuList
          .map((e) => Tab(
                child: Container(
                  child: Text(e),
                  padding: const EdgeInsets.only(
                    bottom: 0,
                  ),
                ),
              ))
          .toList(),
      controller: state.tabController,
    );
  }

  /// 初始化tab Menu
  /// 这个Widget 可用于bottom以及center中部菜单
  /// 可用于 [appBar]的[bottom]
  /// 可用于[body]的item
  Widget _initTabBar() {
    TabBar tabBar = _initTabItem();
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          color: ColorConf.ColorFFFFFF,
        ),
        Container(
          child: tabBar,
          margin: const EdgeInsets.only(left: 22, right: 22),
        )
      ],
    );
  }

  return Scaffold(
//    appBar: AppBar(
//      title: Text('积分'),
//    ),
    body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              stretch: true,
              pinned: true,
              snap: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(100),
              ),
              flexibleSpace: Container(),
            ),
          ),
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SliverAppBarDelegate(_initTabBar()),
          ),
        ];
      },
      body: Container(
        color: ColorConf.Color8048586D,
      ),
    ),
  );
}
