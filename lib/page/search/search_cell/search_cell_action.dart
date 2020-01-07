import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchCellAction { action,toWebView }

class SearchCellActionCreator {
  static Action onAction() {
    return const Action(SearchCellAction.action);
  }
  static Action onToWebView() {
    return const Action(SearchCellAction.toWebView);
  }
}
