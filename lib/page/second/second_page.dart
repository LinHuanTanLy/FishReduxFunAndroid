import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/page/second/second_effect.dart';
import 'package:flutter_android_fun/page/second/second_reducer.dart';
import 'package:flutter_android_fun/page/second/second_view.dart';

import 'second_state.dart';


class SecondPage extends Page<SecondState, Map<String, dynamic>> {
  SecondPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SecondState>(
                adapter: null,
                slots: <String, Dependent<SecondState>>{
                }),
            middleware: <Middleware<SecondState>>[
            ],);

}
