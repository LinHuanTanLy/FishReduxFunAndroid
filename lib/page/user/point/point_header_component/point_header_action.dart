import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PointHeaderAction { action }

class PointHeaderActionCreator {
  static Action onAction() {
    return const Action(PointHeaderAction.action);
  }
}
