import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

///弹窗，吐司共用类
class DialogUtils {
  static void showToast(String msg, BuildContext context,
      {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
