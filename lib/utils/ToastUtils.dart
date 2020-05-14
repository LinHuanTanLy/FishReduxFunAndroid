import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showTs(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0);
  }
}
