import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SystemChildAdapterAction { action }

class SystemChildAdapterActionCreator {
  static Action onAction() {
    return const Action(SystemChildAdapterAction.action);
  }
}
