import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'splash_action.dart';
import 'splash_state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/bg_splash.jpg'))),
  );
}
