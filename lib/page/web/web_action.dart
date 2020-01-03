import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebLoadAction {
  action,
  toShare,
  goBack,
  goForward,
  goRefresh,
  goLike,
  updateCollectStatus
}

class WebLoadActionCreator {
  static Action onAction() {
    return const Action(WebLoadAction.action);
  }

  static Action onUpdateCollectStatus(bool ifCollect) {
    return Action(WebLoadAction.updateCollectStatus, payload: ifCollect);
  }

  static Action onGoBack() {
    return const Action(WebLoadAction.goBack);
  }

  static Action onForward() {
    return const Action(WebLoadAction.goForward);
  }

  static Action onGoFresh() {
    return const Action(WebLoadAction.goRefresh);
  }

  static Action onGoLike() {
    return const Action(WebLoadAction.goLike);
  }

  static Action onToShare() {
    return const Action(WebLoadAction.toShare);
  }
}
