import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'classify_cell_action.dart';
import 'classify_cell_state.dart';

Widget buildView(
    ClassifyCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
                  child: ClipOval(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      '${state?.imgForPic}',
                      fit: BoxFit.contain,
                    ),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorConf.ColorF6f6f6, width: 2),
                      borderRadius: BorderRadius.circular(50)))),
          Container(
            child: Text(
              '${state?.classifyData?.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10, color: ColorConf.Color48586D),
            ),
            margin: const EdgeInsets.only(top: 4),
          )
        ],
      ),
    ),
    onTap: () {
      dispatch(
          ClassifyCellActionCreator.onToAuthorPage(state?.classifyData?.id));
    },
  );
//  return Container(
//    child: Column(
//      children: <Widget>[
//        Expanded(
//          child: Container(
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10), border: Border.all()),
//            child: Image.asset(
//              'images/author_pic9.jpg',
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//        Text(
//          '${state?.classifyData?.name}',
//          style: TextStyle(fontSize: 10, color: ColorConf.Color48586D),
//        )
//      ],
//    ),
//  );
}
