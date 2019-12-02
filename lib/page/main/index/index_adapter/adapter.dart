import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/main/index/banner_component/banner_component.dart';
import 'package:flutter_android_fun/page/main/index/banner_component/banner_state.dart';

import '../index_state.dart';
import 'reducer.dart';

class ListIndexAdapter extends DynamicFlowAdapter<IndexState> {
  ListIndexAdapter()
      : super(
          pool: <String, Component<Object>>{"banner": BannerComponent()},
          connector: _ListIndexConnector(),
          reducer: buildReducer(),
        );
}

class _ListIndexConnector extends ConnOp<IndexState, List<ItemBean>> {
  @override
  List<ItemBean> get(IndexState state) {
    print(
        'when init the Adapter, the dataforBanner in IndexStats is${state.dataForBanner}');
    return <ItemBean>[
      ItemBean('banner', BannerState()..dataForBanner = state.dataForBanner)
    ];
  }

  @override
  void set(IndexState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
