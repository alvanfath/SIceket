import 'package:flutter/material.dart';

extension ShowLoading on BuildContext {
  static late BuildContext ctx;
  Future<void> showLoading() {
    return showDialog(
      context: this,
      barrierDismissible: false,
      builder: (c) {
        ctx = c;
        return WillPopScope(
          onWillPop: () async => false,
          child: const Material(
            color: Color.fromARGB(115, 252, 252, 252),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  void dismiss() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}
