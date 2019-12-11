import 'package:fish_redux/fish_redux.dart';

import 'author_action.dart';
import 'author_state.dart';

Reducer<AuthorState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorState>>{
      AuthorAction.action: _onAction,
      AuthorAction.updateClassifySource: _onUpdateClassifySource,
    },
  );
}

AuthorState _onAction(AuthorState state, Action action) {
  final AuthorState newState = state.clone();
  return newState;
}

AuthorState _onUpdateClassifySource(AuthorState state, Action action) {
  final AuthorState newState = state.clone();
  newState..listForMenu = action.payload;
  print('拿到菜单数据----${newState..listForMenu}');
  return newState;
}
