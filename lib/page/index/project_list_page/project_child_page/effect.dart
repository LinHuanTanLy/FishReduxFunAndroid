import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'action.dart';
import 'state.dart';

Effect<ProjectChildState> buildEffect() {
  return combineEffects(<Object, Effect<ProjectChildState>>{
    ProjectChildAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<ProjectChildState> ctx) {}
void _onInitState(Action action, Context<ProjectChildState> ctx) {
  DioUtils.getInstance().doGet('project/list/1/json?cid=${ctx.state.cid}',
      (data) {
    ProjectSingleListBean _bean = ProjectSingleListBean.fromJson(data);
    ctx.dispatch(
        ProjectChildActionCreator.onUpdateProject(_bean?.data?.datas ?? []));
  });
}
