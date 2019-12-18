import 'package:fish_redux/fish_redux.dart';

import 'web_collection_cell_effect.dart';
import 'web_collection_cell_reducer.dart';
import 'web_collection_cell_state.dart';
import 'web_collection_cell_view.dart';

class WebCollectionCellComponent extends Component<WebCollectionCellState> {
  WebCollectionCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WebCollectionCellState>(
                adapter: null,
                slots: <String, Dependent<WebCollectionCellState>>{
                }),);

}
