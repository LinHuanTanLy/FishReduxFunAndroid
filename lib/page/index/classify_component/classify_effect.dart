import 'package:fish_redux/fish_redux.dart';
import 'classify_action.dart';
import 'classify_effect.dart';
import 'classify_reducer.dart';
import 'classify_state.dart';
import 'classify_view.dart';

Effect<ClassifyState> buildEffect() {
  return combineEffects(<Object, Effect<ClassifyState>>{
    ClassifyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ClassifyState> ctx) {
}
