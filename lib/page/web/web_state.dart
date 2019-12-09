import 'package:fish_redux/fish_redux.dart';

class WebLoadState implements Cloneable<WebLoadState> {
  String url;

  @override
  WebLoadState clone() {
    return WebLoadState()..url;
  }
}

WebLoadState initState(Map<String, dynamic> args) {
  return WebLoadState()..url = 'https://www.baidu.com';
}
