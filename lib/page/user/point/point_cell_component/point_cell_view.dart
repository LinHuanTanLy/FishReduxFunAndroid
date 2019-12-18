import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'point_cell_action.dart';
import 'point_cell_state.dart';

Widget buildView(
    PointCellState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: const EdgeInsets.only(left: 16,right: 16,top:10,bottom: 10),
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${state.pointCell?.reason}'),
            Expanded(child: Container(child: Text('+ ${state?.pointCell?.coinCount}'),alignment: Alignment.centerRight,))
          ],
        )
      ],
    ),
  );
}
