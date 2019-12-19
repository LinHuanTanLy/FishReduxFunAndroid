import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';

class CommArticleCellState implements Cloneable<CommArticleCellState> {
  CommArticleCellBean cellBean;

  @override
  CommArticleCellState clone() {
    return CommArticleCellState()..cellBean = cellBean;
  }
}

CommArticleCellState initState(Map<String, dynamic> args) {
  return CommArticleCellState();
}
