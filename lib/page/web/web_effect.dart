import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'web_action.dart';
import 'web_state.dart';

Effect<WebLoadState> buildEffect() {
  return combineEffects(<Object, Effect<WebLoadState>>{
    WebLoadAction.action: _onAction,
    WebLoadAction.showPopDialog: _onShowPopDialog,
  });
}

void _onAction(Action action, Context<WebLoadState> ctx) {}

void _onShowPopDialog(Action action, Context<WebLoadState> ctx) {
  showGeneralDialog(
      barrierLabel: "top-right-menu",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      context: ctx.context,
      pageBuilder:
          (context, Animation animation, Animation secondaryAnimation) {
        return Column(children: <Widget>[

          Text(';sf'),
          Text(';sf'),
          Text(';sf'),
          Text(';sf'),
          Text(';sf'),
          Text(';sf'),
        ],);
      });
}
