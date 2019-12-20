import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

//TODO replace with your own action
enum ThemeChangeAction { action, onSelectItem }

class ThemeChangeActionCreator {
  static Action onAction() {
    return const Action(ThemeChangeAction.action);
  }

  static Action onSelectItem(int colorIndex) {
    return Action(ThemeChangeAction.onSelectItem, payload: colorIndex);
  }
}
