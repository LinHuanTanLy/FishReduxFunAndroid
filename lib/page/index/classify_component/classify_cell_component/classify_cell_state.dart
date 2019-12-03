import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';

class ClassifyCellState implements Cloneable<ClassifyCellState> {
  ClassifyData classifyData;
  String imgForPic;

  @override
  ClassifyCellState clone() {
    return ClassifyCellState()
      ..classifyData = classifyData
      ..imgForPic = imgForPic;
  }
}

ClassifyCellState initState(Map<String, dynamic> args) {
  return ClassifyCellState();
}
