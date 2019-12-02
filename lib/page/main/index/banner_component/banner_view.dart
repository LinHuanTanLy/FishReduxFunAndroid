import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/global_state/global_state.dart';
import 'package:flutter_android_fun/global_state/global_store.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  return state.dataForBanner.isNotEmpty == true
      ? Container(
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
        )
      : Container();
}
