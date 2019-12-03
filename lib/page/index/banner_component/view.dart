import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
      height: 180,
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
      ));
}
