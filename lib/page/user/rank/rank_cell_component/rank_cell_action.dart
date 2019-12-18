import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RankCellAction { action }

class RankCellActionCreator {
  static Action onAction() {
    return const Action(RankCellAction.action);
  }
}
