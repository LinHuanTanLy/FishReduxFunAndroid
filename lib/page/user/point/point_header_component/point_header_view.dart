import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'point_header_state.dart';

Widget buildView(
    PointHeaderState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.only(left: 12, right: 12, top: 12,bottom: 12),
    height: 160,
    decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: state.themeColor.withAlpha(100),
              offset: Offset(2, 2),
              blurRadius: 20)
        ],
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            colors: <Color>[state.themeColor, state.themeColor.withAlpha(150)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '我的总积分',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        Container(
          child: Text(
            '${state?.userPointBean?.data?.coinCount??""}',
            style: TextStyle(fontSize: 42, color: Colors.white),
          ),
          margin: const EdgeInsets.only(top: 10),
        )
      ],
    ),
  );
}
