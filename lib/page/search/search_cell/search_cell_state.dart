import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/SearchResultBean.dart';

class SearchCellState implements Cloneable<SearchCellState> {
  SearchResultCellBean cellBean;

  @override
  SearchCellState clone() {
    return SearchCellState()..cellBean = cellBean;
  }
}

SearchCellState initState(Map<String, dynamic> args) {
  return SearchCellState();
}
