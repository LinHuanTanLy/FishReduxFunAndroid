import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/ProjectListBean.dart';
import 'package:flutter_android_fun/widget/HtmlTextWidget.dart';
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
        width: state.screenW * 0.85,
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
                HtmlTextWidget(
                  msg: bean?.title,
                  color: ColorConf.ColorFFFFFF,
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '项目推荐',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorConf.Color48586D),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: <Color>[
                          Colors.white,
                          Color(0xffD5F5EE),
                        ])),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '全部',
                          style: TextStyle(
                              fontSize: 10, color: ColorConf.Color18C8A1),
                        ),
                        Container(
                          child: Image.asset(
                            'images/icon_right_arrow.png',
                            height: 10,
                          ),
                          margin: const EdgeInsets.only(left: 6, right: 6),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  dispatch(ProjectActionCreator.onToProjectPage());
                },
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 18),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.projectListDataSource
                  .map((e) => GestureDetector(
                        child: _renderProjectCell(e),
                        onTap: () {
                          dispatch(ProjectActionCreator.onToWebViewPage({
                            "url": e?.link,
                            "title": e?.title,
                            "id": e?.id,
                            "collect": e?.collect
                          }));
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '首页文章',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorConf.Color48586D),
            ),
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.centerRight,
            //     child: Container(
            //       padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8),
            //           gradient: LinearGradient(colors: <Color>[
            //             Colors.white,
            //             Color(0xffD5F5EE),
            //           ])),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: <Widget>[
            //           Text(
            //             '全部',
            //             style: TextStyle(
            //                 fontSize: 10, color: ColorConf.Color18C8A1),
            //           ),
            //           Container(
            //             child: Image.asset(
            //               'images/icon_right_arrow.png',
            //               height: 10,
            //             ),
            //             margin: const EdgeInsets.only(left: 6, right: 6),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    ),
  );
}
