import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PointListAction { action }

class PointListActionCreator {
  static Action onAction() {
    return const Action(PointListAction.action);
  }
}
