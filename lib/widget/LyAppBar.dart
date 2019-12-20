import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

class LyAppBar {
  static AppBar getAppBar(Color color, String title,{Widget bottom}) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: color,
      title: Text(
        title,
        style: TextStyle(fontSize: 18, color: ColorConf.ColorFFFFFF),
      ),
      elevation: 0,
      bottom: bottom,
    );
  }
}
