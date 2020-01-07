import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/HotSearchBean.dart';
import 'package:flutter_android_fun/domain/entity/SearchResultBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'package:flutter_android_fun/utils/ToastUtils.dart';
import 'search_action.dart';
import 'search_state.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.action: _onAction,
    SearchAction.clickTag: _onClickTag,
    SearchAction.toSearch: _onToSearch,
    SearchAction.loadMore: _onLoadMore,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<SearchState> ctx) {}

void _onLoadMore(Action action, Context<SearchState> ctx) {
  String keyWord = ctx.state.textEditingControllerForInput.text;
  _requestSearch(action, ctx, keyWord);
}

void _onClickTag(Action action, Context<SearchState> ctx) {
  String keyWord = action.payload;
  _requestSearch(action, ctx, keyWord);
  _requestFocus(ctx.context);
}

void _onToSearch(Action action, Context<SearchState> ctx) {
  String keyWord = ctx.state.textEditingControllerForInput.text;
  if (keyWord != null && keyWord.isNotEmpty == true) {
    _requestSearch(action, ctx, keyWord);
    _requestFocus(ctx.context);
  } else {
    ToastUtils.showTs('请输入搜索的关键词');
  }
}

void _onInitState(Action action, Context<SearchState> ctx) {
  /// 获取搜索热词
  DioUtils.getInstance().doGet(
    'hotkey/json',
    (data) {
      HotSearchBean hotSearchBean = HotSearchBean.fromJson(data);
      ctx.dispatch(SearchActionCreator.updateHotSearchList(hotSearchBean.data));
    },
  );
}

/// 取消键盘
_requestFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

/// 开始搜索
_requestSearch(Action action, Context<SearchState> ctx, String key) {
  DioUtils.getInstance().doPost('article/query/${ctx.state.pageIndex}/json',
      (data) {
    SearchResultBean resultBean = SearchResultBean.fromJson(data);
    ctx.dispatch(
        SearchActionCreator.onUpdateSearchResult(resultBean?.data?.datas, key));
  }, params: {'k': key});
}
