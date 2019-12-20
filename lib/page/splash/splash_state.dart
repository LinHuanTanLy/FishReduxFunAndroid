import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {

  @override
  SplashState clone() {
    return SplashState();
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
