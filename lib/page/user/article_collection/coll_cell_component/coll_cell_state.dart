import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ArticleCollListBean.dart';

class ArticleCollCellState implements Cloneable<ArticleCollCellState> {
  ArticleCollCellBean articleCollCellBean;

  @override
  ArticleCollCellState clone() {
    return ArticleCollCellState()..articleCollCellBean = articleCollCellBean;
  }
}
