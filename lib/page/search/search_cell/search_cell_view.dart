import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_html/flutter_html.dart';

import 'search_cell_action.dart';
import 'search_cell_state.dart';

Widget buildView(
    SearchCellState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  'images/author_pic9.jpg',
                  width: 16,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 4),
                child: Text(
                  state.cellBean?.author?.isEmpty == true
                      ? state.cellBean?.shareUser
                      : state.cellBean?.author,
                  style: TextStyle(fontSize: 13, color: ColorConf.Color48586D),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Html(
              data: state.cellBean?.title,
              defaultTextStyle: TextStyle(fontSize: 15, color: Colors.black),
            ),
          )
        ],
      ),
    ),
    onTap: () {
      dispatch(SearchCellActionCreator.onToWebView());
    },
  );
}
