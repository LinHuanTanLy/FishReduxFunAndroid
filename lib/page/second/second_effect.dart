import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/conf/TodoTypeConf.dart';
import 'package:flutter_android_fun/domain/entity/TodoListBean.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';

import 'second_action.dart';
import 'second_state.dart';

Effect<SecondState> buildEffect() {
  return combineEffects(<Object, Effect<SecondState>>{
    SecondAction.action: _onAction,

    /// 文章收藏
    SecondAction.toArticleCollection: _onToArticleCollection,

    /// 查看积分
    SecondAction.toSeeCredits: _onToSeeCredits,

    /// 查看排名
    SecondAction.toSeeRank: _onToSeeRank,

    ///查看我的分享
    SecondAction.toSeeShare: _onToSeeShare,

    /// 查看网站收藏
    SecondAction.toWebCollection: _onToWebCollection,

    /// 查看文章收藏
    SecondAction.toArticleCollection: _onToArticleCollection,

    /// 查看体系
    SecondAction.toSystem: _onToSystem,

    /// 查看导航
    SecondAction.toNavigation: _onToNavigation,

    SecondAction.toLogin: _onToLogin,

    /// state 初始化
    Lifecycle.initState: _onInitState,

    Lifecycle.build: _onBuild,
  });
}

void _onAction(Action action, Context<SecondState> ctx) {}

void _onToLogin(Action action, Context<SecondState> ctx) {
  Navigator.pushNamed(ctx.context, 'login');
}

void _onToNavigation(Action action, Context<SecondState> ctx) {
  Navigator.pushNamed(ctx.context, 'navi');
}

void _onToSystem(Action action, Context<SecondState> ctx) {
  Navigator.pushNamed(ctx.context, 'system');
}

void _onToArticleCollection(Action action, Context<SecondState> ctx) {
  if (ctx.state.ifLogin) {
    Navigator.pushNamed(ctx.context, 'article_collection',
        arguments: {"userName": ctx.state.userBean?.data?.username});
  } else {
    ToastUtils.showTs('请先登录');
  }
}

void _onToSeeCredits(Action action, Context<SecondState> ctx) {
  Navigator.pushNamed(ctx.context, 'user_point');
}

void _onToSeeRank(Action action, Context<SecondState> ctx) {
  Navigator.pushNamed(ctx.context, 'user_rank');
}

void _onToSeeShare(Action action, Context<SecondState> ctx) {}

void _onToWebCollection(Action action, Context<SecondState> ctx) {
  if (ctx.state.ifLogin) {
    Navigator.pushNamed(ctx.context, 'web_collection');
  } else {
    ToastUtils.showTs('请先登录');
  }
}

void _onInitState(Action action, Context<SecondState> ctx) {
  _requestUserInfo(action, ctx);
  _requestUserTodoList(action, ctx);
}

void _onBuild(Action action, Context<SecondState> ctx) {
  if (ctx.state.ifLogin != null &&
      ctx.state.ifLogin &&
      ctx.state.userBean == null) {
    _requestUserInfo(action, ctx);
    _requestUserTodoList(action, ctx);
  }
}

/// 请求用户数据
_requestUserInfo(Action action, Context<SecondState> ctx) {
  if (ctx.state.ifLogin != null && ctx.state.ifLogin)
    DioUtils.getInstance().doGet('lg/coin/userinfo/json', (data) {
      UserPointBean _bean = UserPointBean.fromJson(data);
      println('_bean is ${_bean.data.coinCount}');
      ctx.dispatch(SecondActionCreator.onGetUserInfo(_bean));
      if (_bean?.data?.coinCount != ctx.state.userPoint)
        GlobalStore.store.dispatch(
            GlobalActionCreator.onUpdateUserPoint(_bean?.data?.coinCount));
    }, error: (data) {
      ToastUtils.showTs(data);
    });
}

/// 请求用户todo信息
/// 请求参数讲解
/// 页码从1开始，拼接在url 上
///	status 状态， 1-完成；0未完成; 默认全部展示；
///	type 创建时传入的类型, 默认全部展示
///	priority 创建时传入的优先级；默认全部展示
///	orderby 1:完成日期顺序；2.完成日期逆序；3.创建日期顺序；4.创建日期逆序(默认)；
/// 所以这里拿的是 按完成日期逆序的全部列表
_requestUserTodoList(Action action, Context<SecondState> ctx) {
  if (ctx.state.ifLogin != null && ctx.state.ifLogin) {
    DioUtils.getInstance().doGet(
        'lg/todo/v2/list/1/json?type=${TodoTypeConf.todoClassMenu}', (data) {
      TodoListBean _bean = TodoListBean.fromJson(data);
      ctx.dispatch(SecondActionCreator.onGetTodoMenuList(_bean?.data?.datas));
    });
  }
}
