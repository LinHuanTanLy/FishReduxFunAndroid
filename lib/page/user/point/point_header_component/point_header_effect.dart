import 'package:fish_redux/fish_redux.dart';
import 'point_header_action.dart';
import 'point_header_state.dart';

Effect<PointHeaderState> buildEffect() {
  return combineEffects(<Object, Effect<PointHeaderState>>{
    PointHeaderAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PointHeaderState> ctx) {
}
