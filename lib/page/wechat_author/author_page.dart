import 'package:fish_redux/fish_redux.dart';

import 'StateWithTickerProvider.dart';
import 'author_effect.dart';
import 'author_reducer.dart';
import 'author_state.dart';
import 'author_view.dart';

class AuthorPage extends Page<AuthorState, Map<String, dynamic>> {
  @override
  StateWithTickerProvider createState() => StateWithTickerProvider();

  AuthorPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AuthorState>(
                adapter: null,
                slots: <String, Dependent<AuthorState>>{
                }),
            middleware: <Middleware<AuthorState>>[
            ],);

}
