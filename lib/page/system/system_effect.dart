import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SystemTreeBean.dart';
import 'package:flutter_android_fun/net/DioUtils.dart';
import 'system_action.dart';
import 'system_state.dart';

Effect<SystemState> buildEffect() {
  return combineEffects(<Object, Effect<SystemState>>{
    SystemAction.action: _onAction,
    Lifecycle.initState: _onInitState,
  });
}

void _onAction(Action action, Context<SystemState> ctx) {}

void _onInitState(Action action, Context<SystemState> ctx) {
  DioUtils.getInstance().doGet('tree/json', (data) {
    SystemTreeBean _bean = SystemTreeBean.fromJson(data);
    ctx.dispatch(SystemActionCreator.onUpdateSystemList(_bean?.data));
  });
}
