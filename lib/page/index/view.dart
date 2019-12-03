import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          viewService.buildComponent('banner'),
        ],
      ),
    ),
  );
}
