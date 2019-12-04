import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HotArticleAction { action }

class HotArticleActionCreator {
  static Action onAction() {
    return const Action(HotArticleAction.action);
  }
}
