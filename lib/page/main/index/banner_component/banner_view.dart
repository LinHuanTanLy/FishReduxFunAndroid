import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  return state.dataForBanner != null && state.dataForBanner.isNotEmpty == true
      ? Column(
          children: <Widget>[
            Container(
              height: 160,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    '${state.dataForBanner[index].imagePath}',
                    fit: BoxFit.fill,
                  );
                },
                itemCount: state.dataForBanner.length,
                pagination: new SwiperPagination(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              height: 30,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xff18C8A1), Color(0xff7EE3B8)])),
              child: Row(
                children: <Widget>[
                  Text(
                    '您的积分：12121',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  Expanded(
                      child: Container(
                    child: Text(
                      '积分记录',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    alignment: Alignment.centerRight,
                  ))
                ],
              ),
            )
          ],
        )
      : Container(
          child: Text('fuck'),
        );
}
