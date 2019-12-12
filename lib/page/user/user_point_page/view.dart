import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

import 'state.dart';

Widget buildView(
    UserPointState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();
  return Stack(
    children: <Widget>[
      Container(
        height: 1000,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[ColorConf.Color18C8A1, Colors.white])),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          title: Text(
            '积分',
            style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
          ),
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${state.userPointBean?.data?.coinCount ?? 0}',
                style: TextStyle(
                    fontSize: 40,
                    color: ColorConf.ColorFFFFFF,
                    fontWeight: FontWeight.bold),
              ),
              margin: const EdgeInsets.only(left: 20),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                '尊敬的${state?.userPointBean?.data?.username}，您目前的排名为${state?.userPointBean?.data?.rank}',
                style: TextStyle(
                    fontSize: 13,
                    color: ColorConf.ColorFFFFFF,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 50, right: 50, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.topCenter,
              child: Center(
                child: ListView.builder(
                  itemBuilder: _listAdapter.itemBuilder,
                  itemCount: _listAdapter.itemCount,
                ),
              ),
            ))
          ],
        ),
      ),
    ],
  );
}
