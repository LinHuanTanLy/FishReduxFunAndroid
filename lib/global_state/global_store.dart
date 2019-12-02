import 'package:fish_redux/fish_redux.dart';

import 'global_reducer.dart';
import 'global_state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}
