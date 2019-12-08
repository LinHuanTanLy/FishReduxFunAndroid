import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';
import 'project_action.dart';
import 'project_state.dart';

Widget buildView(
    ProjectState state, Dispatch dispatch, ViewService viewService) {
  /// 初始化cell
  Widget _renderProjectCell(ProjectListCellBean bean) {
    return Container(
      child: Container(
        height: 90,
        padding: const EdgeInsets.only(left: 14, right: 14),
        margin: const EdgeInsets.only(right: 14, top: 10),
        width: state.screenW ?? 400 * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                  bean?.envelopePic,
                ),
                fit: BoxFit.fitWidth,
                colorFilter:
                    ColorFilter.mode(Color(0x40000000), BlendMode.darken))),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(bean?.envelopePic),
                      fit: BoxFit.cover)),
              width: 60,
              height: 60,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  bean?.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      shadows: <Shadow>[
                        Shadow(
                            color: Colors.white10,
                            offset: Offset(2, 2),
                            blurRadius: 10)
                      ],
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  bean?.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  return Container(
    margin: const EdgeInsets.only(top: 16),
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
          margin: const EdgeInsets.only(bottom: 18),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.projectListDataSource
                  .map((e) => _renderProjectCell(e))
                  .toList(),
            ),
          ),
        ),
        Text(
          '首页文章',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConf.Color48586D),
        ),
      ],
    ),
  );
}
