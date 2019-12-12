import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/user_point_page/state.dart';
import 'action.dart';

Effect<UserPointState> buildEffect() {
  return combineEffects(<Object, Effect<UserPointState>>{
    PointListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<UserPointState> ctx) {
}
