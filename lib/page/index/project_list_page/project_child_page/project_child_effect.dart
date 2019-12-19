import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'project_child_action.dart';
import 'project_child_state.dart';

Effect<ProjectChildState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectChildState>>{
    ProjectChildAction.action: _onAction,
    ProjectChildAction.reFresh: _onRefresh,
    ProjectChildAction.loadMore: _onLoadMore,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<ProjectChildState> ctx) {}
void _onRefresh(Action action, Context<ProjectChildState> ctx) {
  ctx.state.pageNum = 1;
  _questList(action, ctx, 1);
}

void _onLoadMore(Action action, Context<ProjectChildState> ctx) {
  int pageNum = ++ctx.state.pageNum;
  _questList(action, ctx, pageNum);
}

void _onInitState(Action action, Context<ProjectChildState> ctx) {
  _questList(action, ctx, 1);
}

/// 请求网络
_questList(Action action, Context<ProjectChildState> ctx, int pageNum) {
  DioUtils.getInstance()
      .doGet('project/list/$pageNum/json?cid=${ctx.state.cid}', (data) {
    ProjectSingleListBean _bean = ProjectSingleListBean.fromJson(data);
    ctx.dispatch(
        ProjectChildActionCreator.onUpdateProject(_bean?.data?.datas ?? []));
  });
}
