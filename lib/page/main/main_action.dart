import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/BannerInfoBean.dart';

enum MainAction {
  action,
  clickTab,
  updatePageContent,

}

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  static Action onClickTab(int newIndex) {
    return Action(MainAction.clickTab, payload: newIndex);
  }

  static Action onUpdatePageContent(int newIndex) {
    return Action(MainAction.updatePageContent, payload: newIndex);
  }

}
