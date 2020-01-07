import 'package:fish_redux/fish_redux.dart';

class SearchAdapterState implements Cloneable<SearchAdapterState> {

  @override
  SearchAdapterState clone() {
    return SearchAdapterState();
  }
}

SearchAdapterState initState(Map<String, dynamic> args) {
  return SearchAdapterState();
}
