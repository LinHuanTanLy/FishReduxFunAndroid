import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/SystemTreeBean.dart';

import 'system_cell_action.dart';
import 'system_cell_state.dart';

Widget buildView(
    SystemCellState state, Dispatch dispatch, ViewService viewService) {
  ///
  Widget _renderItemCell(Children children) {
    return GestureDetector(
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: state.color),
        child: Text(
          children?.name,
          style: TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
        ),
      ),
      onTap: () {
        dispatch(SystemCellActionCreator.onToSystemChild(
            {"id": children?.id, "name": children?.name}));
      },
    );
  }

  /// 初始化list数据
  List<Widget> _initChildList() {
    return state?.systemTreeCellBean?.children
        ?.map((e) => _renderItemCell(e))
        ?.toList();
  }

  return Container(
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(state?.systemTreeCellBean?.name),
        Container(
          child: Wrap(
            spacing: 10,
            runAlignment: WrapAlignment.center,
            runSpacing: 10,
            children: _initChildList(),
          ),
          margin: const EdgeInsets.only(top: 10),
        )
      ],
    ),
  );
}
