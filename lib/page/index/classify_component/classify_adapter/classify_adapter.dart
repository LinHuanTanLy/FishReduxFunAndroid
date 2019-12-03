import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_cell_component/classify_cell_component.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_cell_component/classify_cell_state.dart';
import 'package:flutter_android_fun/page/index/classify_component/classify_state.dart';

import 'classify_adapter_reducer.dart';

class ClassifyAdapter extends DynamicFlowAdapter<ClassifyState> {
  ClassifyAdapter()
      : super(
          pool: <String, Component<Object>>{
            'classify_cell': ClassifyCellComponent()
          },
          connector: _ClassifyConnector(),
          reducer: buildReducer(),
        );
}

class _ClassifyConnector extends ConnOp<ClassifyState, List<ItemBean>> {
  @override
  List<ItemBean> get(ClassifyState state) {
    List<ItemBean> _listItemBean = [];
    if (state.dataForClassify != null &&
        state.dataForClassify.isNotEmpty == true) {
      for (int i = 0; i < state.dataForClassify.length; i++) {
        _listItemBean.add(ItemBean(
            'classify_cell',
            ClassifyCellState()
              ..imgForPic = state.dataForImgShow[i]
              ..classifyData = state.dataForClassify[i]));
      }
    }
    return _listItemBean;
  }

  @override
  void set(ClassifyState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
