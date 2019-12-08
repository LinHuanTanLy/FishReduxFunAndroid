import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';
import 'package:flutter_android_fun/domain/entity/CommArticleBean.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';

import 'index_action.dart';
import 'index_state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.action: _onAction,
      IndexAction.initScreenInfo: _onInitScreenInfo,
      IndexAction.updateBannerDataSource: _onUpdateBannerDataSource,
      IndexAction.updateClassifySource: _onUpdateClassifyDataSource,
      IndexAction.updateHotArticleSource: _onUpdateHotArticleDataSource,
      IndexAction.updateIndexArticleSource: _onUpdateIndexArticleDataSource,
      IndexAction.updateProjectSource: _onUpdateProjectDataSource,
    },
  );
}

IndexState _onInitScreenInfo(IndexState state, Action action) {
  final IndexState newState = state.clone();
  Size size = action.payload;
  newState
    ..screenH = size?.height
    ..screenW = size?.width;
  return newState;
}

IndexState _onAction(IndexState state, Action action) {
  final IndexState newState = state.clone();
  return newState;
}

IndexState _onUpdateBannerDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  newState.bannerDataSource = action.payload;
  return newState;
}

IndexState _onUpdateHotArticleDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  newState.hotArticleDataSource = action.payload;
  return newState;
}

IndexState _onUpdateIndexArticleDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  List<CommArticleCellBean> _tempList = action.payload;
  newState.commArticleDataSource = (_tempList);
  return newState;
}

IndexState _onUpdateProjectDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  List<ProjectListCellBean> tempProjectListDataSource = action.payload;
  newState.projectListDataSource = tempProjectListDataSource.length > 5
      ? tempProjectListDataSource.getRange(0, 5).toList()
      : tempProjectListDataSource;
  return newState;
}

IndexState _onUpdateClassifyDataSource(IndexState state, Action action) {
  final IndexState newState = state.clone();
  List _tempList = action.payload;
  if (_tempList != null && _tempList.isNotEmpty == true) {
    _tempList =
        _tempList.length > 9 ? _tempList.getRange(0, 9).toList() : _tempList;
  }
  if (_tempList.length < 10) {
    _tempList.add(ClassifyData(name: '更多'));
  }
  newState.classifyDataSource = _tempList;
  return newState;
}
