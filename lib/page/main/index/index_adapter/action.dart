import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ListIndexAction { action }

class ListIndexActionCreator {
  static Action onAction() {
    return const Action(ListIndexAction.action);
  }
}
