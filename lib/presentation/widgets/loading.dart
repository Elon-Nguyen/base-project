import 'package:flutter/material.dart';

class Loading {
  const Loading._();
  static void show(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: showLoading(),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }

  static Container showLoading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
