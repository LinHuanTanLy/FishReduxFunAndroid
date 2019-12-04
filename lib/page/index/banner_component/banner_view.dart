import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'banner_state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      Container(
        child: Swiper(
          duration: 5,
          transformer: ScaleAndFadeTransformer(),
          autoplay: state.bannerDataSource.isNotEmpty,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: new Image.network(
                '${state.bannerDataSource[index].imagePath}',
                fit: BoxFit.fill,
              ),
              onTap: () {},
            );
          },
          itemCount: state.bannerDataSource.length,
        ),
        height: 180,
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color(0xff18C8A1),
          Color(0XFF7EE3B8),
        ])),
        padding: const EdgeInsets.only(left: 14, right: 14, top: 6, bottom: 6),
        child: Row(
          children: <Widget>[
            Text(
              '您的积分：18888',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '获取记录',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}