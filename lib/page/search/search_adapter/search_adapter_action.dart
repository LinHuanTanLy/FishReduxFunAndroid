import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchAdapterAction { action }

class SearchAdapterActionCreator {
  static Action onAction() {
    return const Action(SearchAdapterAction.action);
  }
}
