import 'package:fish_redux/fish_redux.dart';

enum SystemCellAction { action, toSystemChild }

class SystemCellActionCreator {
  static Action onAction() {
    return const Action(SystemCellAction.action);
  }

  static Action onToSystemChild(dynamic params) {
    return  Action(SystemCellAction.toSystemChild, payload: params);
  }
}
