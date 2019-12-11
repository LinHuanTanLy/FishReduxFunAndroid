import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ClassifyBean.dart';

//TODO replace with your own action
enum AuthorAction { action, updateClassifySource }

class AuthorActionCreator {
  static Action onAction() {
    return const Action(AuthorAction.action);
  }

  static Action onUpdateClassifySource(List<ClassifyData> list) {
    return Action(AuthorAction.updateClassifySource, payload: list);
  }
}
