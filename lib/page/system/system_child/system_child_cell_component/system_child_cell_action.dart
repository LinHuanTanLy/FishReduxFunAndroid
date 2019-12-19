import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SystemChildCellAction { action,toWebView }

class SystemChildCellActionCreator {
  static Action onAction() {
    return const Action(SystemChildCellAction.action);
  }
  static Action onToWebView() {
    return const Action(SystemChildCellAction.toWebView);
  }
}
