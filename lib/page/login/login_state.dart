import 'package:fish_redux/fish_redux.dart';

class loginState implements Cloneable<loginState> {

  @override
  loginState clone() {
    return loginState();
  }
}

loginState initState(Map<String, dynamic> args) {
  return loginState();
}
