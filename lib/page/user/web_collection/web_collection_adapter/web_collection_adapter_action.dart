import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebCollectionAction { action }

class WebCollectionActionCreator {
  static Action onAction() {
    return const Action(WebCollectionAction.action);
  }
}
