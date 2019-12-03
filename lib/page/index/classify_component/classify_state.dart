import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';

class ClassifyState implements Cloneable<ClassifyState> {
  List<ClassifyData> dataForClassify;
  List<String> dataForImgShow = [
    'images/author_pic0.jpg',
    'images/author_pic1.jpg',
    'images/author_pic2.jpg',
    'images/author_pic3.jpg',
    'images/author_pic4.jpg',
    'images/author_pic5.jpg',
    'images/author_pic6.jpg',
    'images/author_pic7.jpg',
    'images/author_pic8.jpg',
    'images/icon_more.png'
  ];

  @override
  ClassifyState clone() {
    return ClassifyState()
      ..dataForClassify = dataForClassify
      ..dataForImgShow = dataForImgShow;
  }
}
