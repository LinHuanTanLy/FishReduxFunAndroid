import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/user/web_collection/web_collection_cell_component/web_collection_cell_component.dart';
import 'package:flutter_android_fun/page/user/web_collection/web_collection_cell_component/web_collection_cell_state.dart';
import 'package:flutter_android_fun/page/user/web_collection/web_collection_page/web_collection_state.dart';

class WebCollectionAdapter extends DynamicFlowAdapter<WebCollectionState> {
  WebCollectionAdapter()
      : super(
          pool: <String, Component<Object>>{
            'web_cell': WebCollectionCellComponent()
          },
          connector: _WebCollectionConnector(),
        );
}

class _WebCollectionConnector
    extends ConnOp<WebCollectionState, List<ItemBean>> {
  @override
  List<ItemBean> get(WebCollectionState state) {
    return state.listForWebkit
        .map((e) => ItemBean(
            'web_cell',
            WebCollectionCellState()
              ..cellCollectionBean = e
              ..themeColor = state.themeColor))
        .toList();
  }

  @override
  void set(WebCollectionState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
