import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/HotArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';

import 'index_action.dart';
import 'index_state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    IndexAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<IndexState> ctx) {}

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
