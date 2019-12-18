import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PointCellAction { action }

class PointCellActionCreator {
  static Action onAction() {
    return const Action(PointCellAction.action);
  }
}
