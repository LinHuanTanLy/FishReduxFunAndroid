import 'package:fish_redux/fish_redux.dart';

import 'search_cell_effect.dart';
import 'search_cell_reducer.dart';
import 'search_cell_state.dart';
import 'search_cell_view.dart';

class SearchCellComponent extends Component<SearchCellState> {
  SearchCellComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchCellState>(
                adapter: null,
                slots: <String, Dependent<SearchCellState>>{
                }),);

}
