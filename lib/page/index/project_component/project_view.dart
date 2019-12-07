import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';
import 'project_action.dart';
import 'project_state.dart';

Widget buildView(
    ProjectState state, Dispatch dispatch, ViewService viewService) {
  Widget _renderProjectCell(ProjectListCellBean bean) {
    return Container(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                  bean?.envelopePic,
                ),
                fit: BoxFit.fill,
                colorFilter:
                    ColorFilter.mode(Color(0x33000000), BlendMode.darken))),
        child: Row(
          children: <Widget>[Text(state.w.toString())],
        ),
      ),
    );
  }

  return Container(
    margin: const EdgeInsets.only(left: 14, top: 16),
    alignment: Alignment.centerLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '项目推荐',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConf.Color48586D),
        ),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.projectListDataSource
                  .map((e) => _renderProjectCell(e))
                  .toList(),
            ),
          ),
        )
      ],
    ),
  );
}
