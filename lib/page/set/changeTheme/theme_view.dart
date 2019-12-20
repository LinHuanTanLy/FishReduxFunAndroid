import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/widget/LyAppBar.dart';

import 'theme_action.dart';
import 'theme_state.dart';

Widget buildView(
    ThemeChangeState state, Dispatch dispatch, ViewService viewService) {
  /// 丢... 我为啥不弄个gridView？？？？？？？

  /// 渲染item
  Widget _renderColorItem(int colorIndex, double w) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        width: w,
        height: w,
        color: ColorConf.ColorList[colorIndex],
      ),
      onTap: () {
        dispatch(ThemeChangeActionCreator.onSelectItem(colorIndex));
      },
    );
  }

  /// 渲染颜色组
  Widget _renderGridView() {
    ///最大行数
    int maxRowCount = state?.maxRowItem;

    double _cellW = (state.screenW - (maxRowCount) * 10) / maxRowCount;

    /// 颜色列表
    List<Color> _listForColors = state?.colorList;

    /// 待选颜色数
    int _listLength = _listForColors.length;

    /// 行数
    int _lineNum = _listLength ~/ maxRowCount;

    /// 是否有余数 有余数表示行数得加一
    int remainder = _listLength % maxRowCount;
    if (remainder > 0) {
      _lineNum = _lineNum + 1;
    }

    /// 整个竖列表
    Column _columnContainer;

    /// 子cell列表
    List<Row> _tempColumnChildList = [];

    for (int i = 0; i < _lineNum; i++) {
      Row _rowContainer;
      List<Widget> _tempRowList = [];
      for (int j = 0; j < maxRowCount; j++) {
        if ((i * maxRowCount + j) >= _listLength) {
          break;
        }
        _tempRowList.add(_renderColorItem(i * maxRowCount + j, _cellW));
      }
      _rowContainer = Row(
        children: _tempRowList,
      );
      _tempColumnChildList.add(_rowContainer);
    }
    _columnContainer = Column(
      children: _tempColumnChildList,
    );
    return _columnContainer;
  }

  return Scaffold(
    appBar: LyAppBar.getAppBar(state.themeColor, '修改主题颜色'),
    body: _renderGridView(),
  );
}
