import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PointCellState state, Dispatch dispatch, ViewService viewService) {
  return Container(
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
            Expanded(child: Text('+ ${state?.pointCell?.coinCount}'))
          ],
        )
      ],
    ),
  );
}
