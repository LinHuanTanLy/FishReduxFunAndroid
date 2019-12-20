import 'package:fish_redux/fish_redux.dart';

enum DrawAction {
  action,
  toSeeCredits,
  toSeeRank,
  toAddArticleShare,
  toAddWebShare,
  toAddTodo,
  toChangeThemeColor,
  toSeeAbout,
  toSeeEnv,
  toLogout,
}

class DrawActionCreator {
  static Action onAction() {
    return const Action(DrawAction.action);
  }

  static Action onToSeeCredits() {
    return const Action(DrawAction.toSeeCredits);
  }

  static Action onToSeeRank() {
    return const Action(DrawAction.toSeeRank);
  }

  static Action onToAddArticleShare() {
    return const Action(DrawAction.toAddArticleShare);
  }

  static Action onToAddWebShare() {
    return const Action(DrawAction.toAddWebShare);
  }

  static Action onToAddTodo() {
    return const Action(DrawAction.toAddTodo);
  }

  static Action onToChangeThemeColor() {
    return const Action(DrawAction.toChangeThemeColor);
  }

  static Action onToSeeAbout() {
    return const Action(DrawAction.toSeeAbout);
  }

  static Action onToSeeEnv() {
    return const Action(DrawAction.toSeeEnv);
  }

  static Action onToLogout() {
    return const Action(DrawAction.toLogout);
  }
}
