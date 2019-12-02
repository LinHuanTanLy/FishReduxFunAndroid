import 'package:fish_redux/fish_redux.dart';

enum GlobalAction { changeThemeColor, updateGlobalW, updateGlobalH }

class GlobalActionCreator {
  static Action onChangeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }

  static Action onUpdateGlobalH(double h) {
    return Action(GlobalAction.updateGlobalH, payload: h);
  }

  static Action onUpdateGlobalW(double w) {
    return  Action(GlobalAction.updateGlobalW, payload: w);
  }
}
