import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_android_fun/domain/entity/HotSearchBean.dart';
import 'package:flutter_android_fun/domain/entity/SearchResultBean.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchState implements GlobalBaseState, Cloneable<SearchState> {
  TextEditingController textEditingControllerForInput;

  List<HotSearchCellBean> hotSearchBeanList;

  List<HotSearchCellBean> searchHistoryList;

  int pageIndex;

  List<SearchResultCellBean> searchResultList;

  RefreshController refreshController;

  /// 输入框是否可以编辑
  bool ifTextFieldAble = true;

  @override
  SearchState clone() {
    return SearchState()
      ..themeColor = themeColor
      ..textEditingControllerForInput = textEditingControllerForInput
      ..hotSearchBeanList = hotSearchBeanList.toList()
      ..searchHistoryList = searchHistoryList.toList()
      ..searchResultList = searchResultList.toList()
      ..pageIndex = pageIndex
      ..ifTextFieldAble = ifTextFieldAble
      ..refreshController = refreshController;
  }

  @override
  bool ifLogin;

  @override
  double screenH;

  @override
  double screenW;

  @override
  Color themeColor;

  @override
  int userPoint;
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState()
    ..textEditingControllerForInput = TextEditingController()
    ..hotSearchBeanList = []
    ..searchHistoryList = [
      HotSearchCellBean(name: '凌宇'),
      HotSearchCellBean(name: '帅哥！')
    ]
    ..searchResultList = []
    ..pageIndex = 0
    ..refreshController = RefreshController()
    ..ifTextFieldAble = true;
}
