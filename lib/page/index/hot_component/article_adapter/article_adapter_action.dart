import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ArticleAdapterAction { action }

class ArticleAdapterActionCreator {
  static Action onAction() {
    return const Action(ArticleAdapterAction.action);
  }
}
