import 'package:fish_redux/fish_redux.dart';

class WebLoadState implements Cloneable<WebLoadState> {
  String url;
  String title;

  @override
  WebLoadState clone() {
    return WebLoadState()
      ..url = url
      ..title = title;
  }
}

WebLoadState initState(Map<String, dynamic> args) {
  return WebLoadState()
    ..url = args['url']
    ..title = args['title'];
}
