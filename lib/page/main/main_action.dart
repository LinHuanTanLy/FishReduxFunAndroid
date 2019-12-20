import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

enum MainAction {
  action,
  clickTab,
  updatePageContent,
  openDraw,
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

  static Action onOpenDraw(BuildContext context) {
    return Action(MainAction.openDraw, payload: context);
  }
}
