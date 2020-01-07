import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/search/search_cell/search_cell_component.dart';
import 'package:flutter_android_fun/page/search/search_cell/search_cell_state.dart';

import '../search_state.dart';
import 'search_adapter_reducer.dart';
import 'search_adapter_state.dart';

class SearchAdapter extends DynamicFlowAdapter<SearchState> {
  SearchAdapter()
      : super(
          pool: <String, Component<Object>>{"cell": SearchCellComponent()},
          connector: _SearchAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _SearchAdapterConnector extends ConnOp<SearchState, List<ItemBean>> {
  @override
  List<ItemBean> get(SearchState state) {
    return state.searchResultList
        .map((e) => ItemBean('cell', SearchCellState()..cellBean = e))
        .toList();
  }

  @override
  void set(SearchState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
