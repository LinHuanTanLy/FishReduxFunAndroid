import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/UserPointBean.dart';

enum SecondAction {
  action,

  /// 拿用户信息
  getUserInfo,

  /// 去积分页面
  toSeeCredits,

  /// 去排名页面
  toSeeRank,

  /// 去网址收藏页面
  toWebCollection,

  /// 去文章收藏页面
  toArticleCollection,

  /// 去分享页面
  toSeeShare,
}

class SecondActionCreator {
  static Action onAction() {
    return const Action(SecondAction.action);
  }

  static Action onToSeeCredits() {
    return const Action(SecondAction.toSeeCredits);
  }

  static Action onToSeeRank() {
    return const Action(SecondAction.toSeeRank);
  }

  static Action onToSeeCollection() {
    return const Action(SecondAction.toWebCollection);
  }

  static Action onToArticleCollection() {
    return const Action(SecondAction.toArticleCollection);
  }

  static Action onToSeeShare() {
    return const Action(SecondAction.toSeeShare);
  }

  static Action onGetUserInfo(UserPointBean userPointBean) {
    return Action(SecondAction.getUserInfo, payload: userPointBean);
  }
}
