import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RankListAction { action }

class RankListActionCreator {
  static Action onAction() {
    return const Action(RankListAction.action);
  }
}
