import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';
import 'package:flutter_android_fun/global_state/global_action.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';

import 'index_action.dart';
import 'index_state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    IndexAction.action: _onAction,
    Lifecycle.initState: _onInitState,
    Lifecycle.build: _onBuild,
  });
}

void _onAction(Action action, Context<IndexState> ctx) {}

void _onBuild(Action action, Context<IndexState> ctx) {
  Size size = MediaQuery.of(ctx.context).size;
  if (ctx.state.screenW != size.width && ctx.state.screenH != size.height) {
    ///只有屏幕变化的时候才发生
    ctx.dispatch(IndexActionCreator.onInitScreenInfo(size));
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateGlobalW(size.width));
    GlobalStore.store
        .dispatch(GlobalActionCreator.onUpdateGlobalH(size.height));
  }
}

void _onInitState(Action action, Context<IndexState> ctx) {
  DioUtils.getInstance().doGet("banner/json", (data) {
    BannerInfoBean _bean = BannerInfoBean.fromJson(data);
    ctx.dispatch(IndexActionCreator.onUpdateBannerSource(_bean?.data ?? []));
  });

  DioUtils.getInstance().doGet('wxarticle/chapters/json', (data) {
    ClassifyBean _bean = ClassifyBean.fromJson(data);
    ctx.dispatch(IndexActionCreator.updateClassifySource(_bean?.data ?? []));
  });

  DioUtils.getInstance().doGet('/article/top/json', (data) {
    HotArticleBean _bean = HotArticleBean.fromJson(data);
    ctx.dispatch(IndexActionCreator.updateHotArticleSource(_bean?.data ?? []));
  });

  DioUtils.getInstance().doGet('article/list/0/json', (data) {
    CommArticleBean _bean = CommArticleBean.fromJson(data);
    ctx.dispatch(
        IndexActionCreator.updateIndexArticleSource(_bean?.data?.datas ?? []));
  });

  DioUtils.getInstance().doGet('article/listproject/0/json', (data) {
    ProjectListBean _bean = ProjectListBean.fromJson(data);
    ctx.dispatch(
        IndexActionCreator.updateProjectSource(_bean?.data?.datas ?? []));
  });
}
