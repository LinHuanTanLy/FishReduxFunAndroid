import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'rank_cell_action.dart';
import 'rank_cell_state.dart';

Widget buildView(
    RankCellState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//        Text(
//          '${state?.userCellRankBean?.rank}',
//          style: TextStyle(
//              fontSize: 20,
//              color: ColorConf.Color48586D,
//              fontWeight: FontWeight.bold),
//        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${state?.userCellRankBean?.username}',
                style: TextStyle(fontSize: 14, color: ColorConf.Color48586D),
              ),
              Container(
                margin: const EdgeInsets.only(top: 6),
                alignment: Alignment.bottomCenter,
                child: Text(
                  '当前等级${state?.userCellRankBean?.level}',
                  style:
                      TextStyle(fontSize: 12, color: ColorConf.Color8048586D),
                ),
              )
            ],
          ),
          margin: const EdgeInsets.only(left: 12),
        ),
        Expanded(
            child: Container(
          alignment: Alignment.centerRight,
          child: Text('${state?.userCellRankBean?.coinCount}'),
        ))
      ],
    ),
  );
}
