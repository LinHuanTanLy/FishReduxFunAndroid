import 'package:fish_redux/fish_redux.dart';

import 'banner_action.dart';
import 'banner_state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<BannerState> ctx) {
}
