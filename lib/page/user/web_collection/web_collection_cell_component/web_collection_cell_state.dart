import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/domain/entity/WebKitCollectionBean.dart';

class WebCollectionCellState implements Cloneable<WebCollectionCellState> {
  WebKitCellCollectionBean cellCollectionBean;
  Color themeColor;
  TextEditingController editingControllerForLink;
  TextEditingController editingControllerForTitle;

  @override
  WebCollectionCellState clone() {
    return WebCollectionCellState()
      ..cellCollectionBean = cellCollectionBean
      ..themeColor = themeColor
      ..editingControllerForLink = editingControllerForLink
      ..editingControllerForTitle = editingControllerForTitle;
  }
}
