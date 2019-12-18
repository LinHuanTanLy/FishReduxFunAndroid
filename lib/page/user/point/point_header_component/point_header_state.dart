import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';

class PointHeaderState implements Cloneable<PointHeaderState> {
  UserPointBean userPointBean;
  Color themeColor;

  @override
  PointHeaderState clone() {
    return PointHeaderState()
      ..userPointBean = userPointBean
      ..themeColor = themeColor;
  }
}
