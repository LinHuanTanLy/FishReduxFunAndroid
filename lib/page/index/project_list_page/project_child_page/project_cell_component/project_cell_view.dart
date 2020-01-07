import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/widget/HtmlTextWidget.dart';

import 'project_cell_action.dart';
import 'project_cell_state.dart';

Widget buildView(
    ProjectCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HtmlTextWidget(
            msg: state?.projectSingleCell?.title,
          ),
          Container(
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    'images/author_pic9.jpg',
                    width: 16,
                  ),
                ),
                Container(
                  child: Text(state?.projectSingleCell?.author,
                      style: TextStyle(
                          fontSize: 12, color: ColorConf.Color8048586D)),
                  margin: const EdgeInsets.only(left: 4),
                )
              ],
            ),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  state?.projectSingleCell?.desc,
                  style: TextStyle(fontSize: 14, color: ColorConf.Color48586D),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                flex: 3,
              ),
              Image.network(
                state?.projectSingleCell?.envelopePic,
                width: 80,
                height: 80,
              ),
            ],
          )
        ],
      ),
    ),
    onTap: () {
      dispatch(ProjectCellActionCreator.onToProjectDetail({
        "url": state?.projectSingleCell?.link,
        "title": state?.projectSingleCell?.title,
        "collect": state?.projectSingleCell?.collect,
      }));
    },
  );
}
