import 'package:fish_redux/fish_redux.dart';

import '../classify_action.dart';
import '../classify_state.dart';


Reducer<ClassifyState> buildReducer() {
  return asReducer(
    <Object, Reducer<ClassifyState>>{
      ClassifyAction.action: _onAction,
    },
  );
}

ClassifyState _onAction(ClassifyState state, Action action) {
  final ClassifyState newState = state.clone();
  return newState;
}
