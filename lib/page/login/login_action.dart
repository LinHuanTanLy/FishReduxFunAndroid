import 'package:fish_redux/fish_redux.dart';

enum LoginAction {
  action,
  toRegister,
  toLogin,
  toFinish,
}

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onToRegister() {
    return const Action(LoginAction.toRegister);
  }

  static Action onToLogin() {
    return const Action(LoginAction.toLogin);
  }

  static Action onToFinish() {
    return const Action(LoginAction.toFinish);
  }
}
